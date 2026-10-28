.class public Lcom/mojang/minecraftpe/mcpelife/̅;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final ̅:[S = null

.field public static ̍:I = 0x2c


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x10

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/̅;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_16_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :goto_0
    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̎;->̒()Z

    const v0, 0x1a9150

    const v1, 0x1a9150

    :goto_1
    const v2, -0x3f3bfbf8

    if-eq v1, v2, :cond_1

    if-eq v1, v0, :cond_0

    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̎;->̒()Z

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̐;->̓()Z

    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̎;->̒()Z

    const v1, -0x3f3bfbf8

    goto :goto_1

    :cond_1
    return-void
.end method

.method public static native ̎(Ljava/lang/String;)Z
.end method

.method public static native ̐()Z
.end method

.method public static native ̒(Ljava/lang/String;)Z
.end method

.method public static native ̓()Z
.end method

.method public static native ̔(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native ̕(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native ̖(Ljava/lang/Object;)I
.end method

.method public static native ̗()I
.end method

.method public static native ̘(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public static native ̙(Ljava/lang/Object;)Ljava/lang/Class;
.end method

.method public static native ̚(Ljava/lang/Object;)Z
.end method

.method public static native ̜(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native ̝(Ljava/lang/Object;)I
.end method

.method public static native ̝(Ljava/lang/String;)Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;^",
            "Ljava/lang/ClassNotFoundException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation
.end method

.method public static native ̝([SIII)Ljava/lang/String;
.end method
