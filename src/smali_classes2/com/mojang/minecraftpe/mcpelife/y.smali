.class public Lcom/mojang/minecraftpe/mcpelife/y;
.super Ljava/lang/Object;
.source "Dex2C"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xf

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/y;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_15_80(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native decode([B)Ljava/lang/String;
.end method

.method public static native decode([BD)Ljava/lang/String;
.end method

.method public static native decode([BF)Ljava/lang/String;
.end method

.method public static native decode([BI)Ljava/lang/String;
.end method

.method public static native decode([BJ)Ljava/lang/String;
.end method

.method public static native decode([BZ)Ljava/lang/String;
.end method

.method public static native decode([BZZ)Ljava/lang/String;
.end method
