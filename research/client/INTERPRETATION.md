# MCPELIFE static-analysis notes

## Confirmed

- The APK contains an additional Android package namespace, `com.mojang.minecraftpe.mcpelife`, plus `lib/arm64-v8a/libMCPELIFE.so` (about 1.8 MB). The DEX class stubs register native methods through `MCPELIFE0` and `Hidden0`; their Java sources are not where the actual client behavior lives.
- The client classes are heavily obfuscated and report `Dex2C` as their compilation origin. `MCPELIFE0` loads `libMCPELIFE.so`; its `registerNativesForClass` entry point and `Hidden0.special_clinit_*` methods indicate that the Java stubs hand execution to native implementations. The native library exports `JNI_OnLoad` and contains native method-registration strings for the injected namespace.
- `MainActivity` itself registers as class 0 with the MCPELIFE native loader during class initialization, tying the injected library to the main app launch path.
- The decompiled surface includes a custom UI layer (dialogs, rounded views, bitmap/font setup), JSON parsing, and an `HttpURLConnection` request/response path. The request method is supplied as the byte string `R0VU` to an overloaded native `decode` method; `R0VU` is Base64 for `GET`, but that specific decoder behavior still needs confirmation from native code. This points to a client UI/config or network path, not yet to any particular gameplay module.
- The injected library's ELF dependencies are `libc`, `libm`, and `libdl`; it has no direct `DT_NEEDED` dependency on Minecraft's `libminecraftpe.so`. It imports `dl_iterate_phdr`, so it can enumerate loaded images, but this alone does not prove memory patching or hooks.
- `assets/MCPELIFE.json` is **not JSON**: its SFNT signature and font name table identify a Lexend variable font. The client references Android's `Typeface.createFromAsset`, so this is likely a UI font resource, not a module list.
- Twenty-two root-level randomly named assets begin with the same `\0IAP\x02\0\0\0\x08\x06` header and then high-entropy bytes. This looks like a structured/protected asset format, but its payload and purpose are not decoded yet.

## Do not over-interpret keyword hits

The first broad keyword sweep produced many false positives from vanilla localization/resources (for example, words occurring in translated text) and from random binary data transformed with every possible single-byte XOR key. Those are leads only, not proof that a module exists. The meaningful path forward is native code and the structured root assets, not raw match counts. No module name such as Xray/ESP/Aura has yet been confirmed from decoded client code.

## Next reverse-engineering steps

1. Preserve and inspect all `MCPELIFE0`/`Hidden0` Java loader classes alongside the obfuscated client stubs.
2. Map native registration and relevant native APIs in `libMCPELIFE.so`; identify how the `IAP v2` assets are opened/decrypted before attempting to label their contents.
3. Only after the loader/data path is understood, map actual feature implementations and decide how to update them. The Android package/library must also be rebuilt and signed to yield an installable APK; changing this source-analysis bundle alone does not update the app.
