# MCPELIFE static-analysis notes

## Confirmed

- The APK contains an additional Android package namespace, `com.mojang.minecraftpe.mcpelife`, plus `lib/arm64-v8a/libMCPELIFE.so` (about 1.8 MB). The DEX class stubs register native methods through `MCPELIFE0` and `Hidden0`; their Java sources are not where the actual client behavior lives.
- The client classes are heavily obfuscated and report `Dex2C` as their compilation origin. `MCPELIFE0` loads `libMCPELIFE.so`; its `registerNativesForClass` entry point and `Hidden0.special_clinit_*` methods indicate that the Java stubs hand execution to native implementations. The native library exports `JNI_OnLoad` and contains native method-registration strings for the injected namespace.
- `MainActivity` itself registers as class 0 with the MCPELIFE native loader during class initialization, tying the injected library to the main app launch path.
- The decompiled surface includes a custom UI layer (dialogs, rounded views, bitmap/font setup), JSON parsing, and an `HttpURLConnection` request/response path. The request method is supplied as the byte string `R0VU` to an overloaded native `decode` method; `R0VU` is Base64 for `GET`, but that specific decoder behavior still needs confirmation from native code. This points to a client UI/config or network path, not yet to any particular gameplay module.
- The injected library's ELF dependencies are `libc`, `libm`, and `libdl`; it has no direct `DT_NEEDED` dependency on Minecraft's `libminecraftpe.so`. It imports `dl_iterate_phdr`, so it can enumerate loaded images, but this alone does not prove memory patching or hooks.
- Ghidra recovered the JNI class-registration dispatch table. IDs 1-25 belong to MCPELIFE classes (including Unicode/combining-mark class names); IDs 26-28 are PairIP signature/license runtime classes. The DEX contains 147 `native` methods across MCPELIFE IDs 1-25; each registration wrapper has the matching method count plus one generated helper pointer. A provisional DEX-to-native pointer map is saved at `native/ghidra/native-method-map.tsv`.
- The targeted native decompile covered the class wrappers and mapped native functions (165 of 172 pointer labels decompiled in the latest pass). The mapped methods expose reflection, files, `MessageDigest`, string/byte conversion, `ApplicationInfo`, JSON, UI, and HTTP plumbing. The code and decompiled pseudocode contain no confirmed Xray/ESP/Aura/etc. labels; this is not proof that no feature exists because names are obfuscated and root assets remain opaque.
- `assets/MCPELIFE.json` is **not JSON**: its SFNT signature and font name table identify a Lexend variable font. The client references Android's `Typeface.createFromAsset`, so this is likely a UI font resource, not a module list.
- Twenty-two root-level randomly named assets begin with the same `\0IAP\x02\0\0\0\x08\x06` header and then high-entropy bytes. This looks like a structured/protected asset format, but its payload and purpose are not decoded yet.

## User-provided lead: Spiral in-game click GUI

The user identifies the injected client as **Spiral** and reports that it renders an in-game click GUI. Treat that as a concrete lead and do not mistake the earlier failure to find readable branding/module keywords for evidence that the client or GUI is absent. The static sweep still has not independently recovered the `Spiral` string or the GUI implementation. The recovered native UI helpers (`mcpelife.l`, class ID 14) include Android `View` creation, layout parameters, outline handling, callbacks, and dialog-related routines; that confirms substantial UI plumbing but, by itself, does not establish which parts render the in-game click GUI. Prioritize tracing the UI entry points, string/asset decoding, and any bridge into Minecraft's rendering/input path.

## Do not over-interpret keyword hits

The first broad keyword sweep produced many false positives from vanilla localization/resources (for example, words occurring in translated text) and from random binary data transformed with every possible single-byte XOR key. Those are leads only, not proof that a module exists. The meaningful path forward is native code and the structured root assets, not raw match counts. No feature name such as Xray/ESP/Aura has yet been recovered from decoded client code; this does not contradict the user's report of the Spiral click GUI.

## Next reverse-engineering steps

1. Use `native/ghidra/native-method-map.tsv` to map native handlers back to DEX signatures; prioritize the obfuscated class IDs 16-25 and decode the overloaded string/short-array helpers.
2. Identify the consumer and key/transform for the 22 `IAP v2` root assets, then determine whether they are UI images, resource blobs, or feature/config payloads.
3. Only after the loader/data path is understood, map actual gameplay feature implementations and decide how to update them. The Android package/library must also be rebuilt and signed to yield an installable APK; changing this source-analysis bundle alone does not update the app.
