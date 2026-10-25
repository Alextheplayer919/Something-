#!/usr/bin/env python3
"""Build a DEX ↔ native-function map from the checked-in probe outputs.

This uses the per-class native registration tables decoded from the ELF by
Ghidra. For each MCPELIFE class, the first N function pointers in its
registration wrapper correspond to the N DEX `native` methods; one trailing
pointer is a generated helper registration and is kept separately. The script
checks these counts before writing the map; it does not execute the APK.
"""
from __future__ import annotations

import glob
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEX_DIR = ROOT / "research/client/dex"
WRAPPER_REPORT = ROOT / "research/client/native/ghidra/targeted-decompile.txt"
OUT = ROOT / "research/client/native/ghidra/native-method-map.tsv"
SUMMARY = ROOT / "research/client/native/ghidra/native-method-map-summary.md"

# Class id is the integer passed to MCPELIFE0.registerNativesForClass.
ID_TO_DESCRIPTOR = {
    1: "Lcom/mojang/minecraftpe/mcpelife/a;",
    2: "Lcom/mojang/minecraftpe/mcpelife/b;",
    3: "Lcom/mojang/minecraftpe/mcpelife/c;",
    4: "Lcom/mojang/minecraftpe/mcpelife/d;",
    5: "Lcom/mojang/minecraftpe/mcpelife/e;",
    6: "Lcom/mojang/minecraftpe/mcpelife/f;",
    7: "Lcom/mojang/minecraftpe/mcpelife/g;",
    8: "Lcom/mojang/minecraftpe/mcpelife/h;",
    9: "Lcom/mojang/minecraftpe/mcpelife/i;",
    10: "Lcom/mojang/minecraftpe/mcpelife/j;",
    11: "Lcom/mojang/minecraftpe/mcpelife/k;",
    12: "Lcom/mojang/minecraftpe/mcpelife/l$a;",
    13: "Lcom/mojang/minecraftpe/mcpelife/l$b;",
    14: "Lcom/mojang/minecraftpe/mcpelife/l;",
    15: "Lcom/mojang/minecraftpe/mcpelife/y;",
    16: "Lcom/mojang/minecraftpe/mcpelife/\u0305;",
    17: "Lcom/mojang/minecraftpe/mcpelife/\u030d;",
    18: "Lcom/mojang/minecraftpe/mcpelife/\u030e;",
    19: "Lcom/mojang/minecraftpe/mcpelife/\u0310;",
    20: "Lcom/mojang/minecraftpe/mcpelife/\u0312;",
    21: "Lcom/mojang/minecraftpe/mcpelife/\u0313;",
    22: "Lcom/mojang/minecraftpe/mcpelife/\u0314;",
    23: "Lcom/mojang/minecraftpe/mcpelife/\u0315;",
    24: "Lcom/mojang/minecraftpe/mcpelife/\u0316;",
    25: "Lcom/mojang/minecraftpe/mcpelife/\u0317;",
}


def read_uleb(data: bytes, pos: int) -> tuple[int, int]:
    value = shift = 0
    while True:
        byte = data[pos]
        pos += 1
        value |= (byte & 0x7F) << shift
        if byte < 0x80:
            return value, pos
        shift += 7


def dex_methods(path: Path) -> dict[str, list[tuple[str, str]]]:
    data = path.read_bytes()
    string_count, string_off = struct.unpack_from("<II", data, 0x38)
    strings = []
    for i in range(string_count):
        pos = struct.unpack_from("<I", data, string_off + i * 4)[0]
        _, pos = read_uleb(data, pos)
        end = data.find(b"\0", pos)
        strings.append(data[pos:end].decode("utf-8", "replace"))

    type_count, type_off = struct.unpack_from("<II", data, 0x40)
    types = [strings[struct.unpack_from("<I", data, type_off + i * 4)[0]] for i in range(type_count)]

    proto_count, proto_off = struct.unpack_from("<II", data, 0x48)
    protos = []
    for i in range(proto_count):
        _, return_type, params_off = struct.unpack_from("<III", data, proto_off + i * 12)
        params = []
        if params_off:
            count = struct.unpack_from("<I", data, params_off)[0]
            params = [types[struct.unpack_from("<H", data, params_off + 4 + 2 * j)[0]] for j in range(count)]
        protos.append("(" + "".join(params) + ")" + types[return_type])

    method_count, method_off = struct.unpack_from("<II", data, 0x58)
    method_ids = []
    for i in range(method_count):
        class_idx, proto_idx, name_idx = struct.unpack_from("<HHI", data, method_off + 8 * i)
        method_ids.append((types[class_idx], strings[name_idx], protos[proto_idx]))

    class_count, class_off = struct.unpack_from("<II", data, 0x60)
    output = {}
    for i in range(class_count):
        fields = struct.unpack_from("<IIIIIIII", data, class_off + i * 32)
        class_idx, _, _, _, _, _, class_data_off, _ = fields
        descriptor = types[class_idx]
        if not class_data_off:
            continue
        pos = class_data_off
        static_count, pos = read_uleb(data, pos)
        instance_count, pos = read_uleb(data, pos)
        direct_count, pos = read_uleb(data, pos)
        virtual_count, pos = read_uleb(data, pos)
        for _ in range(static_count + instance_count):
            _, pos = read_uleb(data, pos)
            _, pos = read_uleb(data, pos)

        methods = []
        for count in (direct_count, virtual_count):
            method_idx = 0
            for _ in range(count):
                diff, pos = read_uleb(data, pos)
                method_idx += diff
                access_flags, pos = read_uleb(data, pos)
                _, pos = read_uleb(data, pos)  # code_off
                if access_flags & 0x100:  # ACC_NATIVE
                    _, name, signature = method_ids[method_idx]
                    methods.append((name, signature))
        if methods:
            output[descriptor] = methods
    return output


def wrappers(path: Path) -> dict[int, list[str]]:
    text = path.read_text(encoding="utf-8", errors="replace")
    blocks = re.split(r"(?=/\* FUNCTION )", text)
    result = {}
    for block in blocks:
        m = re.search(r"/\* FUNCTION .*?class_id=(\d+) class=([^ ]+)", block)
        if not m:
            continue
        class_id = int(m.group(1))
        # The tables contain the N client native methods followed by one helper
        # method registered on an auxiliary obfuscated class.
        pointers = re.findall(r"=\s*&LAB_([0-9A-Fa-f]{6,16})", block)
        result[class_id] = [f"0x{int(x, 16):08x}" for x in pointers]
    return result


def main() -> None:
    all_methods = {}
    for dex in sorted(DEX_DIR.glob("*.dex")):
        all_methods.update(dex_methods(dex))
    class_wrappers = wrappers(WRAPPER_REPORT)

    rows = ["class_id\tdescriptor\tmethod_index\tmethod_name\tsignature\tfunction_address\tmap_status"]
    summary = [
        "# Native method map",
        "",
        "Derived by matching DEX ACC_NATIVE entries to the Ghidra-decoded per-class JNI registration arrays.",
        "The class wrappers consistently expose N method implementations plus one extra auxiliary registration.",
        "The first N pointers are paired in registration order; treat the function-name pairing as a strong structural lead, not semantic names.",
        "",
        "| ID | Class | DEX native methods | Wrapper pointers | Status |",
        "|---:|---|---:|---:|---|",
    ]
    missing = []
    for class_id, descriptor in ID_TO_DESCRIPTOR.items():
        methods = all_methods.get(descriptor, [])
        ptrs = class_wrappers.get(class_id, [])
        good = len(ptrs) == len(methods) + 1
        status = "N native + 1 helper" if good else f"count mismatch ({len(methods)} native, {len(ptrs)} pointers)"
        summary.append(f"| {class_id} | `{descriptor}` | {len(methods)} | {len(ptrs)} | {status} |")
        if not good:
            missing.append((class_id, descriptor, len(methods), len(ptrs)))
        for index, (name, signature) in enumerate(methods):
            address = ptrs[index] if index < len(ptrs) else ""
            rows.append(f"{class_id}\t{descriptor}\t{index}\t{name}\t{signature}\t{address}\t{status}")
        if good:
            rows.append(f"{class_id}\t{descriptor}\tAUX\t<generated helper>\t\t{ptrs[-1]}\tlast pointer excluded from DEX method list")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(rows) + "\n", encoding="utf-8")
    summary.append("")
    if missing:
        summary.append("Count mismatches requiring manual review:")
        summary.extend(f"- ID {i}: {desc} ({n} DEX natives, {p} pointers)" for i, desc, n, p in missing)
    else:
        summary.append("All 25 MCPELIFE classes matched N native DEX methods to N+1 native pointers.")
    SUMMARY.write_text("\n".join(summary) + "\n", encoding="utf-8")
    print(f"Wrote {len(rows)-1} rows; mismatches={len(missing)}")


if __name__ == "__main__":
    main()
