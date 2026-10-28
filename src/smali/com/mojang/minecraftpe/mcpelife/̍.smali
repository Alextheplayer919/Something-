.class public Lcom/mojang/minecraftpe/mcpelife/̍;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final ̅:[S = null

.field public static ̍:I = -0x56


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x11

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/̍;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_17_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :goto_0
    const v0, 0x33645f7

    const v1, 0x33645f7

    :goto_1
    const v2, -0x11780f0b

    if-eq v1, v2, :cond_1

    if-eq v1, v0, :cond_0

    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̅;->̗()I

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̍;->̘()Z

    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̅;->̗()I

    const v1, -0x11780f0b

    goto :goto_1

    :cond_1
    return-void
.end method

.method public static native ̎(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native ̐(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public static native ̒(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/reflect/Method;
.end method

.method public static native ̓(Ljava/lang/Object;)[C
.end method

.method public static native ̔(Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native ̕(Ljava/lang/Object;)Z
.end method

.method public static native ̖(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public static native ̗(Ljava/lang/Object;)[B
.end method

.method public static native ̘()Z
.end method

.method public static native ̙(Ljava/lang/Object;)V
.end method

.method public static native ̚(Ljava/lang/Object;Z)V
.end method

.method public static native ̜(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/reflect/Field;
.end method

.method public static native ̝(Ljava/lang/Object;)Ljava/lang/Class;
.end method

.method public static native ̞(Ljava/lang/Object;)[Ljava/io/File;
.end method

.method public static native ̟(Ljava/lang/Object;)Ljava/lang/String;
.end method
