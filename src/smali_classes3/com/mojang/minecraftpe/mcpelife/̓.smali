.class public Lcom/mojang/minecraftpe/mcpelife/̓;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field public static ̅:I = 0x5b


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x15

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/̓;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_21_60(Ljava/lang/Class;)V

    return-void
.end method

.method public static native ̅(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public static native ̍()I
.end method

.method public static native ̎(Ljava/lang/Object;)I
.end method

.method public static native ̐(Z)Ljava/lang/Boolean;
.end method

.method public static native ̒(Ljava/lang/Object;)[B
.end method

.method public static native ̓(Ljava/lang/Object;)Ljava/io/File;
.end method
