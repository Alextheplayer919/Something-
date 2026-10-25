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
    private static final int MAX_MATCHED = 120;
    private static final int MAX_CODE_CHARS = 24000;
    private static final long[] REGISTRATION_FUNCTIONS = {
        0x12d0c8L, // MCPELIFE0.registerNativesForClass JNI implementation
        0x12cddcL, // JNI_OnLoad helper
        0x12d06cL, // registration table bootstrap
        0x12b8d8L  // JNI class/method lookup bootstrap
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
                if (!feature && !context && !registration) continue;
                if (matched >= MAX_MATCHED) continue;
                matched++;
                out.write("\n\n/* FUNCTION " + f.getName() + " @ " + f.getEntryPoint() +
                          " bytes=" + f.getBody().getNumAddresses() +
                          " feature=" + feature + " context=" + context +
                          " registration=" + registration + " */\n");
                if (code.length() > MAX_CODE_CHARS) code = code.substring(0, MAX_CODE_CHARS) + "\n/* truncated */\n";
                out.write(code);
            }
            out.write("\n\nSUMMARY: candidate_functions=" + functions +
                      " decompiled=" + completed + " failed_or_timed_out=" + timedOut +
                      " retained=" + matched + "\n");
        } finally {
            decomp.dispose();
        }
        println("Ghidra static scan: candidates=" + functions + " decompiled=" + completed +
                " timeouts=" + timedOut + " retained=" + matched + " output=" + outFile);
    }
}
