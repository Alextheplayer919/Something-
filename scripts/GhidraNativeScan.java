// Ghidra headless post-script: decompile the MCPELIFE AArch64 library and
// retain only methods whose pseudocode contains feature or client plumbing terms.
// Arguments: output directory. This is static analysis; the library is never run.
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.address.Address;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GhidraNativeScan extends GhidraScript {
    private static final Pattern FEATURE = Pattern.compile(
        "(?i)\\b(x-?ray|ore.?esp|killaura|kill.?aura|aura|aimbot|esp|tracer|" +
        "wallhack|nofall|no.?fall|fly|flight|freecam|reach|nuker|scaffold|" +
        "speedhack|module|toggle|keybind|cheat|hack|mcpelife)\\b"
    );
    private static final Pattern CONTEXT = Pattern.compile(
        "(?i)(mcpelife|MCPE|HttpURLConnection|BitmapFactory|Typeface|createFromAsset|" +
        "RegisterNatives|registerNativesForClass|dl_iterate_phdr|libminecraftpe|" +
        "getAssets|decrypt|decode|assets/|JNI_OnLoad)"
    );
    private static final Pattern METHOD_POINTER = Pattern.compile("=\\s*&LAB_([0-9a-fA-F]{6,16})");
    private static final int MAX_NATIVE_METHODS = 450;
    private static final int MAX_NATIVE_CODE_CHARS = 16000;
    private static final int MAX_MATCHED = 120;
    private static final int MAX_CODE_CHARS = 24000;
    private static final long[] REGISTRATION_FUNCTIONS = {
        0x12cdc8L, // registerNativesForClass pointer installed by JNI_OnLoad
        0x12cddcL, // JNI_OnLoad helper
        0x12d06cL, // registration table bootstrap
        0x12d0c8L, // native callback reached during registration
        0x12b8d8L  // JNI class/method lookup bootstrap
    };
    // Ghidra image base is 0x100000. These 29 targets come from the native
    // registration pointer table (class IDs 0..28) in the ELF relocations.
    private static final long[] CLASS_TARGETS = {
        0x1af1e8L, 0x1b96dcL, 0x1bd4f4L, 0x1be578L, 0x1beb98L,
        0x1bf114L, 0x1bf9f0L, 0x1c01e0L, 0x1c0b70L, 0x1c14c8L,
        0x1c1e24L, 0x1c277cL, 0x1f1b24L, 0x1f2ad4L, 0x1ec674L,
        0x26ffb8L, 0x2120ecL, 0x233880L, 0x24af5cL, 0x25a6f0L,
        0x263da8L, 0x266178L, 0x268100L, 0x2686bcL, 0x26a96cL,
        0x26d7f4L, 0x278a28L, 0x284e40L, 0x2770bcL
    };
    private static final String[] CLASS_NAMES = {
        "MainActivity", "mcpelife.a", "mcpelife.b", "mcpelife.c", "mcpelife.d",
        "mcpelife.e", "mcpelife.f", "mcpelife.g", "mcpelife.h", "mcpelife.i",
        "mcpelife.j", "mcpelife.k", "mcpelife.l$a", "mcpelife.l$b", "mcpelife.l",
        "mcpelife.y", "mcpelife.̅", "mcpelife.̍", "mcpelife.C0001", "mcpelife.C0000",
        "mcpelife.C0003", "mcpelife.̓", "mcpelife.̔", "mcpelife.̕", "mcpelife.̖",
        "mcpelife.C0002", "com.pairip.SignatureCheck", "com.pairip.VMRunner", "com.pairip.licensecheck.LicenseActivity"
    };

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outDir = args.length > 0 ? new File(args[0]) : new File("research/client/native/ghidra");
        outDir.mkdirs();
        File outFile = new File(outDir, "targeted-decompile.txt");
        int functions = 0;
        int completed = 0;
        int timedOut = 0;
        int matched = 0;
        Map<Long, Set<Integer>> nativeMethodOwners = new LinkedHashMap<>();
        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        // Auto-analysis may leave the JNI callback as a label rather than a
        // function because it is reached through RegisterNatives' pointer table.
        for (long address : REGISTRATION_FUNCTIONS) {
            ghidra.program.model.address.Address entry = toAddr(address);
            if (currentProgram.getFunctionManager().getFunctionAt(entry) == null) {
                disassemble(entry);
                createFunction(entry, null);
            }
        }
        for (long address : CLASS_TARGETS) {
            ghidra.program.model.address.Address entry = toAddr(address);
            if (currentProgram.getFunctionManager().getFunctionAt(entry) == null &&
                currentProgram.getFunctionManager().getFunctionContaining(entry) == null) {
                disassemble(entry);
                createFunction(entry, null);
            }
        }

        try (BufferedWriter out = new BufferedWriter(new FileWriter(outFile))) {
            out.write("MCPELIFE NATIVE STATIC DECOMPILE (Ghidra)\n");
            out.write("Program: " + currentProgram.getName() + "\n");
            out.write("This file contains selected pseudocode only; all analysis is static.\n\n");

            FunctionIterator it = currentProgram.getFunctionManager().getFunctions(true);
            while (it.hasNext() && !monitor.isCancelled()) {
                Function f = it.next();
                if (f.isThunk() || f.getBody().getNumAddresses() < 32) continue;
                functions++;
                DecompileResults result = decomp.decompileFunction(f, 8, monitor);
                if (!result.decompileCompleted() || result.getDecompiledFunction() == null) {
                    timedOut++;
                    continue;
                }
                completed++;
                String code = result.getDecompiledFunction().getC();
                boolean feature = FEATURE.matcher(code).find();
                boolean context = CONTEXT.matcher(code).find();
                boolean registration = false;
                for (long address : REGISTRATION_FUNCTIONS) {
                    if (f.getEntryPoint().getOffset() == address) registration = true;
                }
                int classId = -1;
                for (int i = 0; i < CLASS_TARGETS.length; i++) {
                    if (f.getBody().contains(toAddr(CLASS_TARGETS[i]))) classId = i;
                }
                boolean translatedClass = classId >= 0;
                // Class IDs 16..25 are the opaque MCPELIFE utility/feature group.
                // Their registration arrays contain native method function pointers.
                if (classId >= 16 && classId <= 25) {
                    Matcher pointerMatcher = METHOD_POINTER.matcher(code);
                    while (pointerMatcher.find()) {
                        long target = Long.parseLong(pointerMatcher.group(1), 16);
                        nativeMethodOwners.computeIfAbsent(target, k -> new LinkedHashSet<>()).add(classId);
                    }
                }
                if (!feature && !context && !registration && !translatedClass) continue;
                if (matched >= MAX_MATCHED) continue;
                matched++;
                out.write("\n\n/* FUNCTION " + f.getName() + " @ " + f.getEntryPoint() +
                          " bytes=" + f.getBody().getNumAddresses() +
                          " feature=" + feature + " context=" + context +
                          " registration=" + registration +
                          (translatedClass ? " class_id=" + classId + " class=" + CLASS_NAMES[classId] : "") +
                          " */\n");
                if (code.length() > MAX_CODE_CHARS) code = code.substring(0, MAX_CODE_CHARS) + "\n/* truncated */\n";
                out.write(code);
            }
            out.write("\n\nSUMMARY: candidate_functions=" + functions +
                      " decompiled=" + completed + " failed_or_timed_out=" + timedOut +
                      " retained=" + matched + "\n");

            File methodsFile = new File(outDir, "hidden-native-methods.txt");
            Map<Long, Set<Integer>> methodFunctions = new LinkedHashMap<>();
            for (Map.Entry<Long, Set<Integer>> entry : nativeMethodOwners.entrySet()) {
                Address target = toAddr(entry.getKey());
                Function targetFunction = currentProgram.getFunctionManager().getFunctionAt(target);
                if (targetFunction == null) targetFunction = currentProgram.getFunctionManager().getFunctionContaining(target);
                if (targetFunction == null) {
                    disassemble(target);
                    targetFunction = createFunction(target, null);
                }
                if (targetFunction != null) {
                    long functionAddress = targetFunction.getEntryPoint().getOffset();
                    methodFunctions.computeIfAbsent(functionAddress, k -> new LinkedHashSet<>()).addAll(entry.getValue());
                }
            }
            int nativeDecompiled = 0;
            int nativeFailed = 0;
            try (BufferedWriter methods = new BufferedWriter(new FileWriter(methodsFile))) {
                methods.write("MCPELIFE HIDDEN NATIVE METHOD IMPLEMENTATIONS (static Ghidra output)\n");
                methods.write("Sources: function-pointer tables registered for client class IDs 16-25.\n");
                methods.write("Class names for IDs 16-25: " + CLASS_NAMES[16] + ", " + CLASS_NAMES[17] +
                              ", " + CLASS_NAMES[18] + ", " + CLASS_NAMES[19] + ", " + CLASS_NAMES[20] +
                              ", " + CLASS_NAMES[21] + ", " + CLASS_NAMES[22] + ", " + CLASS_NAMES[23] +
                              ", " + CLASS_NAMES[24] + ", " + CLASS_NAMES[25] + "\n");
                methods.write("Native method pointer labels found: " + nativeMethodOwners.size() +
                              "; unique functions: " + methodFunctions.size() + "\n");
                for (Map.Entry<Long, Set<Integer>> entry : methodFunctions.entrySet()) {
                    Function nativeFunction = currentProgram.getFunctionManager().getFunctionAt(toAddr(entry.getKey()));
                    if (nativeFunction == null) continue;
                    DecompileResults nativeResult = decomp.decompileFunction(nativeFunction, 8, monitor);
                    if (!nativeResult.decompileCompleted() || nativeResult.getDecompiledFunction() == null) {
                        nativeFailed++;
                        continue;
                    }
                    nativeDecompiled++;
                    String nativeCode = nativeResult.getDecompiledFunction().getC();
                    methods.write("\n\n/* FUNCTION " + nativeFunction.getName() + " @ " +
                                  nativeFunction.getEntryPoint() + " bytes=" + nativeFunction.getBody().getNumAddresses() +
                                  " class_ids=" + entry.getValue() + " feature=" + FEATURE.matcher(nativeCode).find() +
                                  " context=" + CONTEXT.matcher(nativeCode).find() + " */\n");
                    if (nativeCode.length() > MAX_NATIVE_CODE_CHARS) {
                        nativeCode = nativeCode.substring(0, MAX_NATIVE_CODE_CHARS) + "\n/* truncated */\n";
                    }
                    methods.write(nativeCode);
                }
                methods.write("\n\nSUMMARY: native_pointer_labels=" + nativeMethodOwners.size() +
                              " unique_functions=" + methodFunctions.size() + " decompiled=" + nativeDecompiled +
                              " failed=" + nativeFailed + "\n");
            }
        } finally {
            decomp.dispose();
        }
        println("Ghidra static scan: candidates=" + functions + " decompiled=" + completed +
                " timeouts=" + timedOut + " retained=" + matched + " output=" + outFile);
    }
}
