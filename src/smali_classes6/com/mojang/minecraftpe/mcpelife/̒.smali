.class public Lcom/mojang/minecraftpe/mcpelife/̒;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final ̅:[S = null

.field public static ̍:I = 0x6


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x14

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/̒;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_20_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :goto_0
    const v0, 0x33759b0

    const v1, 0x33759b0

    :goto_1
    const v2, 0x37cf298a

    if-eq v1, v0, :cond_1

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̎;->̒()Z

    const v1, 0x37cf298a

    goto :goto_1
.end method

.method public static native ̎([B)Ljava/lang/String;
.end method

.method public static native ̐(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native ̒(Ljava/lang/Object;)Z
.end method

.method public static native ̓()I
.end method

.method public static native ̔(Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public static native ̕(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public static native ̖(Ljava/lang/Object;I)Ljava/lang/StringBuilder;
.end method

.method public static native ̗(Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public static native ̘(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public static native ̙(Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public static native ̚(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/StringBuilder;
.end method

.method public static native ̜(I)Ljava/lang/String;
.end method

.method public static native ̝(Ljava/lang/Object;)V
.end method
