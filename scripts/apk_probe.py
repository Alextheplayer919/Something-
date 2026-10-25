#!/usr/bin/env python3
"""Inspect an APK (or any zip) and write a compact, committable research report.

Designed to run where the real, LFS-backed Minecraft.apk is available (a GitHub
Actions runner). It never copies the whole APK into git: it writes a summary, a
gzipped file listing, and a small curated set of candidate files that are likely
to hold an embedded/alternate client and its modules.
"""
import gzip
import json
import os
import re
import sys
import zipfile
from collections import Counter, defaultdict

APK = os.environ.get("APK_PATH", "Minecraft.apk")
OUT = os.environ.get("REPORT_DIR", "research")
EXTRACT_BUDGET = int(os.environ.get("EXTRACT_BUDGET", 24 * 1024 * 1024))

KEYWORDS = re.compile(
    r"(client|module|mod|menu|hack|cheat|inject|loader|patch|plugin|addon|"
    r"script|config|manifest|version|metadata|native|lib/|\.dex$|\.so$|"
    r"\.js$|\.jsx$|\.ts$|\.lua$|\.json$|\.xml$|\.smali$|\.jar$|\.apk$|"
    r"\.zip$|\.obb$|\.cfg$|\.ini$|\.properties$|\.txt$|\.dat$)",
    re.I,
)
# Files that are pure text/code and small enough to be interesting. The large
# native libraries and resource blobs are listed but not extracted in bulk.
EXTRACTABLE = re.compile(
    r"(\.json$|\.js$|\.jsx$|\.ts$|\.lua$|\.txt$|\.xml$|\.smali$|\.cfg$|"
    r"\.ini$|\.properties$|\.yml$|\.yaml$|\.md$|\.dex$)",
    re.I,
)


def human(n):
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024 or unit == "GB":
            return f"{n:.1f}{unit}" if unit != "B" else f"{n}B"
        n /= 1024.0


def main():
    os.makedirs(OUT, exist_ok=True)
    extract_dir = os.path.join(OUT, "extract")
    os.makedirs(extract_dir, exist_ok=True)

    if not os.path.exists(APK):
        raise SystemExit(f"APK not found: {APK}")
    size = os.path.getsize(APK)
    if size < 1024 * 1024:
        raise SystemExit(
            f"{APK} is only {size} bytes - this looks like an unresolved Git LFS pointer, "
            "not the real APK. Check that the runner checked out with lfs: true."
        )

    with zipfile.ZipFile(APK) as zf:
        infos = zf.infolist()

        full_list = os.path.join(OUT, "apk-filelist.txt.gz")
        with gzip.open(full_list, "wt", encoding="utf-8", errors="replace") as fh:
            for i in infos:
                fh.write(f"{i.file_size}\t{i.compress_size}\t{i.CRC:08x}\t{i.filename}\n")

        top = defaultdict(lambda: [0, 0])
        ext = Counter()
        for i in infos:
            parts = i.filename.split("/")
            key = parts[0] if len(parts) > 1 else "(root files)"
            top[key][0] += 1
            top[key][1] += i.file_size
            ext[os.path.splitext(i.filename)[1].lower() or "(none)"] += i.file_size

        uncompressed = sum(i.file_size for i in infos)
        compressed = sum(i.compress_size for i in infos)
        lines = [
            "APK PROBE REPORT",
            "=" * 60,
            f"path: {APK}",
            f"file size on disk: {size} ({human(size)})",
            f"entries: {len(infos)}",
            f"uncompressed total: {uncompressed} ({human(uncompressed)})",
            f"compressed total: {compressed} ({human(compressed)})",
            "",
            "TOP-LEVEL DIRECTORIES (entries, uncompressed size)",
        ]
        for k, (count, s) in sorted(top.items(), key=lambda kv: -kv[1][1])[:60]:
            lines.append(f"  {k:<50} {count:>7}  {human(s):>10}")
        lines += ["", "BY EXTENSION (uncompressed size)"]
        for k, s in ext.most_common(40):
            lines.append(f"  {k:<30} {human(s):>10}")
        lines += ["", "50 LARGEST FILES"]
        for i in sorted(infos, key=lambda x: -x.file_size)[:50]:
            lines.append(f"  {human(i.file_size):>10}  c={human(i.compress_size):>9}  {i.filename}")

        # Keyword hits: the interesting, non-asset-looking parts of the archive.
        hits = [i for i in infos if KEYWORDS.search(i.filename)]
        lines += ["", f"KEYWORD HITS ({len(hits)} of {len(infos)} entries)", ""]
        for i in sorted(hits, key=lambda x: x.filename)[:1500]:
            lines.append(f"  {human(i.file_size):>10}  {i.filename}")
        if len(hits) > 1500:
            lines.append(f"  ... {len(hits) - 1500} more (see apk-filelist.txt.gz)")

        lines += ["", "ZIP COMMENT / SIGNATURE BLOCKS"]
        lines.append(f"  comment: {zf.comment[:200]!r}")
        sigs = [i.filename for i in infos if i.filename.upper().startswith("META-INF/")]
        lines.append(f"  META-INF entries: {len(sigs)}")
        for s in sigs[:30]:
            lines.append(f"    {s}")

        with open(os.path.join(OUT, "apk-summary.txt"), "w", encoding="utf-8", errors="replace") as fh:
            fh.write("\n".join(lines) + "\n")

        # Curated extraction: small text/code/config files, prioritising paths
        # that mention a client or modules, then anything else extractable.
        candidates = [i for i in infos if EXTRACTABLE.search(i.filename) and i.file_size <= 2 * 1024 * 1024]
        candidates.sort(
            key=lambda i: (
                0 if re.search(r"(client|module|mod|menu|inject|loader|plugin|hack|cheat)", i.filename, re.I) else 1,
                i.file_size,
                i.filename,
            )
        )
        used = 0
        taken = []
        for i in candidates:
            if used + i.file_size > EXTRACT_BUDGET:
                break
            target = os.path.join(extract_dir, i.filename)
            if not os.path.abspath(target).startswith(os.path.abspath(extract_dir) + os.sep):
                continue
            os.makedirs(os.path.dirname(target), exist_ok=True)
            try:
                with zf.open(i) as src, open(target, "wb") as dst:
                    dst.write(src.read())
            except Exception as e:
                print(f"skip {i.filename}: {e}", file=sys.stderr)
                continue
            used += i.file_size
            taken.append({"path": i.filename, "size": i.file_size, "crc": f"{i.CRC:08x}"})

        # Always grab the binary manifest and a few DEX headers for identification.
        for name in ("AndroidManifest.xml", "classes.dex", "classes2.dex"):
            if any(x["path"] == name for x in taken):
                continue
            try:
                info = zf.getinfo(name)
            except KeyError:
                continue
            if info.file_size > 8 * 1024 * 1024:
                continue
            with zf.open(info) as src, open(os.path.join(extract_dir, name.replace("/", "__")), "wb") as dst:
                dst.write(src.read(8 * 1024 * 1024))
            taken.append({"path": name, "size": info.file_size, "crc": f"{info.CRC:08x}"})

        with open(os.path.join(OUT, "extracted.json"), "w", encoding="utf-8") as fh:
            json.dump(
                {"apk_size": size, "entry_count": len(infos), "extracted_bytes": used, "files": taken},
                fh,
                indent=2,
            )

    print(f"Wrote report to {OUT}/ (extracted {human(used)} in {len(taken)} files)")


if __name__ == "__main__":
    main()
