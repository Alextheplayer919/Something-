#!/usr/bin/env python3
"""Pull the MCPELIFE client (and its likely module payloads) out of the APK.

Runs on a GitHub Actions runner, where the LFS-backed Minecraft.apk exists.
Writes a small, committable bundle under research/client/ so the client can be
studied and rebuilt without shipping the 632 MB APK around.
"""
import hashlib
import json
import os
import re
import zipfile
from collections import Counter

APK = os.environ.get("APK_PATH", "Minecraft.apk")
OUT = os.environ.get("CLIENT_DIR", "research/client")
RANDOM_ASSET = re.compile(r"^assets/[A-Za-z0-9_]{12,24}$")


def human(n):
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024 or unit == "GB":
            return f"{n:.1f}{unit}" if unit != "B" else f"{n}B"
        n /= 1024.0


def sniff(b):
    if b.startswith(b"PK\x03\x04"):
        return "ZIP"
    if b.startswith(b"\x00\x01\x00\x00") or b.startswith(b"OTTO") or b.startswith(b"true"):
        return "TrueType/OpenType font"
    if b.startswith(b"dex\n"):
        return "DEX"
    if b.startswith(b"\x7fELF"):
        return "ELF"
    if b.startswith(b"\x1f\x8b"):
        return "GZIP"
    if b.startswith(b"BM"):
        return "BMP"
    if b[:1] in (b"{", b"["):
        return "JSON?"
    if b.startswith(b"\x89PNG"):
        return "PNG"
    if b.startswith(b"OggS"):
        return "OGG"
    printable = sum(1 for c in b[:64] if 32 <= c < 127 or c in (9, 10, 13))
    return f"binary/text? (printable {printable}/64)"


def main():
    os.makedirs(OUT, exist_ok=True)
    report = []
    with zipfile.ZipFile(APK) as zf:
        names = set(zf.namelist())
        wanted = []
        for n in sorted(names):
            if n == "assets/MCPELIFE.json":
                wanted.append(n)
            elif n == "lib/arm64-v8a/libMCPELIFE.so":
                wanted.append(n)
            elif re.fullmatch(r"classes\d*\.dex", n):
                wanted.append(n)
            elif n in ("AndroidManifest.xml", "META-INF/TESTKEY.RSA", "META-INF/TESTKEY.SF", "META-INF/MANIFEST.MF"):
                wanted.append(n)
            elif RANDOM_ASSET.match(n):
                wanted.append(n)

        report.append("MCPELIFE CLIENT EXTRACTION")
        report.append("=" * 60)
        report.append(f"apk: {APK} ({os.path.getsize(APK)} bytes)")
        report.append(f"selected entries: {len(wanted)}")
        report.append("")

        hashes = {}
        for n in wanted:
            info = zf.getinfo(n)
            data = zf.read(info)
            rel = n
            if n.startswith("classes") and n.endswith(".dex"):
                rel = "dex/" + n
            target = os.path.join(OUT, rel)
            os.makedirs(os.path.dirname(target), exist_ok=True)
            with open(target, "wb") as fh:
                fh.write(data)
            hashes[n] = {
                "size": len(data),
                "sha256": hashlib.sha256(data).hexdigest(),
                "magic": sniff(data[:64]),
                "head_hex": data[:48].hex(),
            }

        for n in sorted(hashes, key=lambda x: (x.split("/")[0], x)):
            h = hashes[n]
            report.append(f"{n}\n    {h['size']} ({human(h['size'])})  {h['magic']}\n    sha256={h['sha256']}\n    head={h['head_hex']}")

        with open(os.path.join(OUT, "FILES.json"), "w") as fh:
            json.dump(hashes, fh, indent=2)

        # Inspect the oddly named MCPELIFE.json asset before assuming it is JSON.
        cfg_path = os.path.join(OUT, "assets/MCPELIFE.json")
        raw = open(cfg_path, "rb").read()
        report += ["", "assets/MCPELIFE.json CONTENT INSPECTION", "=" * 60]
        if raw.startswith((b"\x00\x01\x00\x00", b"OTTO", b"true")):
            report.append("Despite the .json filename, this is a TrueType/OpenType font (SFNT signature).")
            report.append("It is not the module configuration; retain as an obfuscation/distraction clue only.")
        else:
            try:
                cfg = json.loads(raw.decode("utf-8"))
                report.append(f"type: {type(cfg).__name__}")
                if isinstance(cfg, dict):
                    report.append(f"top-level keys ({len(cfg)}):")
                    for k, v in list(cfg.items())[:80]:
                        report.append(f"  {k}: {type(v).__name__} {str(v)[:160]}")
                elif isinstance(cfg, list):
                    report.append(f"length: {len(cfg)}; first item: {str(cfg[:1])[:400]}")
                with open(os.path.join(OUT, "MCPELIFE.pretty.json"), "w") as fh:
                    json.dump(cfg, fh, indent=2, ensure_ascii=False)
            except Exception as e:
                report.append(f"not plain UTF-8 JSON: {e}")
                report.append(f"first 256 bytes: {raw[:256]!r}")

        # Readable strings in the client's native library, filtered to likely
        # configuration / module / version / path material.
        so_path = os.path.join(OUT, "lib/arm64-v8a/libMCPELIFE.so")
        so = open(so_path, "rb").read()
        strings_found = [s.decode("ascii", "replace") for s in re.findall(rb"[ -~]{5,}", so)]
        interesting = [
            s for s in strings_found
            if re.search(r"(?i)(module|mcpe|life|version|\.json|assets/|\.so|hook|menu|click|float|speed|aura|key|http|/data/|lib/)", s)
        ]
        report += ["", f"libMCPELIFE.so STRINGS (filtered, {len(interesting)} of {len(strings_found)})", "=" * 60]
        for s in sorted(set(interesting))[:600]:
            report.append("  " + s[:300])
        report += ["", "ELF NEEDED LIBS / SONAME"]
        for s in sorted(set(strings_found)):
            if s.startswith("lib") and s.endswith(".so"):
                report.append("  " + s[:200])

        # Also list DEX string constants containing MCPELIFE-ish material.
        report += ["", "DEX STRING LEADS", "=" * 60]
        for dex in sorted(os.listdir(os.path.join(OUT, "dex"))):
            d = open(os.path.join(OUT, "dex", dex), "rb").read()
            ss = [s.decode("ascii", "replace") for s in re.findall(rb"[ -~]{6,}", d)]
            hits = sorted(set(
                s for s in ss
                if re.search(r"(?i)(mcpelife|MCPELIFE\.json|libMCPELIFE|/assets/[A-Za-z0-9]{12,}|com/mojang/minecraftpe/mcpelife)", s)
            ))
            report.append(f"-- {dex}: {len(hits)} hits")
            for s in hits[:200]:
                report.append("   " + s[:250])

    with open(os.path.join(OUT, "ANALYSIS.txt"), "w", encoding="utf-8", errors="replace") as fh:
        fh.write("\n".join(report) + "\n")
    print(f"Wrote {len(wanted)} files to {OUT}")


if __name__ == "__main__":
    main()
