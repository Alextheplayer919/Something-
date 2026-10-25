#!/usr/bin/env python3
"""Hunt for hidden/obfuscated cheat-client modules inside the APK.

Runs on the Actions runner with the real APK. Deliberately paranoid: searches
plain, reversed, ROT13, single-byte-XOR and base64 views of the data, and ranks
files by how many distinct cheat-module terms they contain.
"""
import base64
import codecs
import collections
import json
import math
import os
import re
import zipfile

APK = os.environ.get("APK_PATH", "Minecraft.apk")
OUT = os.environ.get("CLIENT_DIR", "research/client")
MAX_PLAIN_SCAN = 8 * 1024 * 1024
MAX_TRANSFORM = 512 * 1024          # heavy views only on this much data
MAX_B64_CHUNKS = 120

CHEAT = [
    r"x-?ray", r"xray", r"ore\s?esp", r"cave\s?finder", r"killaura", r"kill\s?aura",
    r"aura", r"aimbot", r"triggerbot", r"auto\s?clicker", r"reach", r"hitbox",
    r"criticals", r"velocity", r"no\s?fall", r"no\s?clip", r"fly", r"flight",
    r"elytra\s?fly", r"boat\s?fly", r"jesus", r"spider", r"phase", r"blink",
    r"freecam", r"esp", r"tracer", r"wallhack", r"nuker", r"auto\s?tool",
    r"fast\s?break", r"fast\s?place", r"speedhack", r"bhop", r"scaffold",
    r"tower", r"step", r"anti\s?knockback", r"no\s?swing",
    r"auto\s?totem", r"auto\s?armor", r"chest\s?stealer", r"fullbright",
    r"no\s?hurtcam", r"anti\s?fire", r"wtap", r"no\s?slowdown", r"auto\s?sprint",
    r"fast\s?ladder", r"safe\s?walk", r"air\s?jump", r"airjump",
    r"high\s?jump", r"glide", r"derp", r"auto\s?fish", r"auto\s?eat",
    r"anti\s?void", r"bed\s?aura", r"surround", r"no\s?render", r"chest\s?esp",
]
PLUMBING = [
    r"module", r"toggle", r"enabled", r"keybind", r"category",
    r"clickgui", r"click\s?gui", r"preset", r"setting",
    r"hook", r"inject", r"packet", r"offset", r"signature", r"decrypt",
    r"MCPELIFE", r"mcpe\s?life",
]
CHEAT_RE = re.compile(rb"(?i)\b(" + b"|".join(p.encode() for p in CHEAT) + rb")\b")
PLUMB_RE = re.compile(rb"(?i)\b(" + b"|".join(p.encode() for p in PLUMBING) + rb")\b")
B64_RE = re.compile(rb"[A-Za-z0-9+/]{16,}={0,2}")
XOR_TABLES = {k: bytes(i ^ k for i in range(256)) for k in range(1, 256)}


def entropy(data):
    if not data:
        return 0.0
    c = collections.Counter(data)
    n = len(data)
    return -sum((v / n) * math.log2(v / n) for v in c.values())


def hits(view):
    c = sorted({m.group(1).decode("latin-1").lower() for m in CHEAT_RE.finditer(view)})
    p = sorted({m.group(1).decode("latin-1").lower() for m in PLUMB_RE.finditer(view)})
    snippet = ""
    m = CHEAT_RE.search(view)
    if m:
        a, b = max(0, m.start() - 60), min(len(view), m.end() + 60)
        snippet = view[a:b].decode("latin-1", "replace").replace("\n", " ")[:180]
    return c, p, snippet


def views(data, heavy):
    yield "plain", data
    if not heavy:
        return
    d = data[:MAX_TRANSFORM]
    yield "reversed", d[::-1]
    yield "rot13", codecs.encode(d.decode("latin-1"), "rot_13").encode("latin-1")
    for k, table in XOR_TABLES.items():
        yield f"xor{k:02x}", d.translate(table)
    for n, m in enumerate(B64_RE.finditer(d)):
        if n >= MAX_B64_CHUNKS:
            break
        chunk = m.group()[:4096]
        try:
            dec = base64.b64decode(chunk + b"=" * (-len(chunk) % 4))
            if dec:
                yield f"b64@{m.start()}", dec
        except Exception:
            pass


def main():
    os.makedirs(OUT, exist_ok=True)
    rows, details, entropies = [], [], {}
    with zipfile.ZipFile(APK) as zf:
        for i in zf.infolist():
            name = i.filename
            clientish = (
                (name.startswith("assets/") and name.count("/") == 1)
                or name.startswith("lib/") or name.endswith(".dex")
                or name == "AndroidManifest.xml"
            )
            if i.file_size > MAX_PLAIN_SCAN and not clientish:
                continue
            try:
                data = zf.read(i)
            except Exception as e:
                print("read fail", name, e)
                continue
            res = {}
            for label, view in views(data, heavy=clientish):
                c, p, snip = hits(view)
                if c or p:
                    res[label] = {"cheat": c, "plumbing": p, "snippet": snip}
                if label == "plain" and c:
                    break
            if not res:
                continue
            allcheat = sorted({t for v in res.values() for t in v["cheat"]})
            allplumb = sorted({t for v in res.values() for t in v["plumbing"]})
            score = 2 * len(allcheat) + len(allplumb)
            rows.append((score, len(allcheat), len(allplumb), i.file_size, name, sorted(res.keys())[:6]))
            details.append({
                "path": name, "size": i.file_size, "score": score,
                "cheat_terms": allcheat, "plumbing_terms": allplumb,
                "views": {k: v for k, v in list(res.items())[:12]},
            })
            if clientish:
                entropies[name] = {"size": i.file_size, "entropy": round(entropy(data[:200000]), 3)}

    rows.sort(reverse=True)
    lines = ["HIDDEN MODULE HUNT", "=" * 60,
             f"entries with any hit: {len(rows)}", "",
             "RANKED FILES (score = 2*distinct cheat terms + plumbing terms)", "=" * 60]
    for score, nc, np, size, name, vh in rows[:250]:
        lines.append(f"  score={score:<4} cheat={nc:<3} plumbing={np:<3} size={size:<9} {name}  views={','.join(vh)}")
    lines += ["", "CLIENT-ISH FILE ENTROPY (0-8; ~8 = encrypted/compressed)", "=" * 60]
    for n, v in sorted(entropies.items()):
        lines.append(f"  {v['entropy']:<6} {v['size']:<9} {n}")
    lines += ["", "DETAILS (top 120 by score)", "=" * 60]
    for d in sorted(details, key=lambda x: -x["score"])[:120]:
        lines.append(f"\n-- {d['path']} ({d['size']} bytes, score {d['score']})")
        lines.append(f"   cheat: {', '.join(d['cheat_terms'][:60])}")
        lines.append(f"   plumbing: {', '.join(d['plumbing_terms'][:60])}")
        for k, v in d["views"].items():
            if v["cheat"] or v["plumbing"]:
                lines.append(f"   [{k}] {','.join(v['cheat'][:20])} | {','.join(v['plumbing'][:20])}")
                if v["snippet"]:
                    lines.append(f"        {v['snippet']}")

    with open(os.path.join(OUT, "MODULE_HUNT.txt"), "w", encoding="utf-8", errors="replace") as fh:
        fh.write("\n".join(lines) + "\n")
    with open(os.path.join(OUT, "MODULE_HUNT.json"), "w", encoding="utf-8") as fh:
        json.dump({"rows": rows[:500], "details": details[:500], "entropy": entropies}, fh, indent=2)
    print(f"Wrote module hunt report: {len(rows)} files with hits")


if __name__ == "__main__":
    main()
