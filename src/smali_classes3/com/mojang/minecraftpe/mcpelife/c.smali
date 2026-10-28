.class public abstract Lcom/mojang/minecraftpe/mcpelife/c;
.super Ljava/lang/Object;
.source "Dex2C"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x3

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/c;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_3_10(Ljava/lang/Class;)V

    return-void
.end method

.method public static native a(Ljava/io/InputStream;)Ljava/lang/String;
.end method
