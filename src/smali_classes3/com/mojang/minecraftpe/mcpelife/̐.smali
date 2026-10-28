.class public Lcom/mojang/minecraftpe/mcpelife/̐;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final ̅:[S = null

.field public static ̍:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x13

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/̐;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_19_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :goto_0
    const v0, 0x3357791

    const v1, 0x3357791

    :goto_1
    const v2, 0x58a6d1b9

    if-eq v1, v0, :cond_1

    if-eq v1, v2, :cond_0

    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̐;->̓()Z

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    invoke-static {}, Lcom/mojang/minecraftpe/mcpelife/̍;->̘()Z

    const v1, 0x58a6d1b9

    goto :goto_1
.end method

.method public static native ̎(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native ̐(Landroid/content/Context;)Z
.end method

.method public static native ̐(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public static native ̓()Z
.end method
