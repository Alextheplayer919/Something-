# MCPELIFE static-analysis notes

## Confirmed

- The APK contains an additional Android package namespace, `com.mojang.minecraftpe.mcpelife`, plus `lib/arm64-v8a/libMCPELIFE.so` (about 1.8 MB). The DEX class stubs register native methods through `MCPELIFE0` and `Hidden0`; their Java sources are not where the actual client behavior lives.
- The client classes are heavily obfuscated and report `Dex2C` as their compilation origin. The native library exports `JNI_OnLoad` and contains native method-registration strings for the injected namespace.
- `assets/MCPELIFE.json` is **not JSON**: its SFNT signature and font name table identify a Lexend variable font. Treat the filename as misleading, not as a module list.
- Twenty-two root-level randomly named assets begin with the same `\0IAP\x02\0\0\0\x08\x06` header and then high-entropy bytes. This looks like a structured/protected asset format, but its payload and purpose are not decoded yet.

## Do not over-interpret keyword hits

The first broad keyword sweep produced many false positives from vanilla localization/resources (for example, words occurring in translated text) and from random binary data transformed with every possible single-byte XOR key. Those are leads only, not proof that a module exists. The meaningful path forward is native code and the structured root assets, not raw match counts. No module name such as Xray/ESP/Aura has yet been confirmed from decoded client code.

## Next reverse-engineering steps

1. Preserve and inspect all `MCPELIFE0`/`Hidden0` Java loader classes alongside the obfuscated client stubs.
2. Map native registration and relevant native APIs in `libMCPELIFE.so`; identify how the `IAP v2` assets are opened/decrypted before attempting to label their contents.
3. Only after the loader/data path is understood, map actual feature implementations and decide how to update them. The Android package/library must also be rebuilt and signed to yield an installable APK; changing this source-analysis bundle alone does not update the app.
