# Native method map

Derived by matching DEX ACC_NATIVE entries to the Ghidra-decoded per-class JNI registration arrays.
The class wrappers consistently expose N method implementations plus one extra auxiliary registration.
The first N pointers are paired in registration order; treat the function-name pairing as a strong structural lead, not semantic names.

| ID | Class | DEX native methods | Wrapper pointers | Status |
|---:|---|---:|---:|---|
| 1 | `Lcom/mojang/minecraftpe/mcpelife/a;` | 1 | 2 | N native + 1 helper |
| 2 | `Lcom/mojang/minecraftpe/mcpelife/b;` | 2 | 3 | N native + 1 helper |
| 3 | `Lcom/mojang/minecraftpe/mcpelife/c;` | 1 | 2 | N native + 1 helper |
| 4 | `Lcom/mojang/minecraftpe/mcpelife/d;` | 1 | 2 | N native + 1 helper |
| 5 | `Lcom/mojang/minecraftpe/mcpelife/e;` | 1 | 2 | N native + 1 helper |
| 6 | `Lcom/mojang/minecraftpe/mcpelife/f;` | 1 | 2 | N native + 1 helper |
| 7 | `Lcom/mojang/minecraftpe/mcpelife/g;` | 1 | 2 | N native + 1 helper |
| 8 | `Lcom/mojang/minecraftpe/mcpelife/h;` | 1 | 2 | N native + 1 helper |
| 9 | `Lcom/mojang/minecraftpe/mcpelife/i;` | 1 | 2 | N native + 1 helper |
| 10 | `Lcom/mojang/minecraftpe/mcpelife/j;` | 1 | 2 | N native + 1 helper |
| 11 | `Lcom/mojang/minecraftpe/mcpelife/k;` | 1 | 2 | N native + 1 helper |
| 12 | `Lcom/mojang/minecraftpe/mcpelife/l$a;` | 8 | 9 | N native + 1 helper |
| 13 | `Lcom/mojang/minecraftpe/mcpelife/l$b;` | 1 | 2 | N native + 1 helper |
| 14 | `Lcom/mojang/minecraftpe/mcpelife/l;` | 16 | 17 | N native + 1 helper |
| 15 | `Lcom/mojang/minecraftpe/mcpelife/y;` | 7 | 8 | N native + 1 helper |
| 16 | `Lcom/mojang/minecraftpe/mcpelife/̅;` | 15 | 16 | N native + 1 helper |
| 17 | `Lcom/mojang/minecraftpe/mcpelife/̍;` | 15 | 16 | N native + 1 helper |
| 18 | `Lcom/mojang/minecraftpe/mcpelife/̎;` | 29 | 30 | N native + 1 helper |
| 19 | `Lcom/mojang/minecraftpe/mcpelife/̐;` | 4 | 5 | N native + 1 helper |
| 20 | `Lcom/mojang/minecraftpe/mcpelife/̒;` | 13 | 14 | N native + 1 helper |
| 21 | `Lcom/mojang/minecraftpe/mcpelife/̓;` | 6 | 7 | N native + 1 helper |
| 22 | `Lcom/mojang/minecraftpe/mcpelife/̔;` | 6 | 7 | N native + 1 helper |
| 23 | `Lcom/mojang/minecraftpe/mcpelife/̕;` | 1 | 2 | N native + 1 helper |
| 24 | `Lcom/mojang/minecraftpe/mcpelife/̖;` | 7 | 8 | N native + 1 helper |
| 25 | `Lcom/mojang/minecraftpe/mcpelife/̗;` | 7 | 8 | N native + 1 helper |

All 25 MCPELIFE classes matched N native DEX methods to N+1 native pointers.
