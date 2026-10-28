.class public abstract Lcom/mojang/minecraftpe/mcpelife/l;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field public static a:Landroid/os/Handler;

.field public static b:Z

.field public static c:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xe

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/l;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_14_00(Ljava/lang/Class;)V

    return-void
.end method

.method public static native synthetic a(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
.end method

.method public static native synthetic b(Landroid/app/AlertDialog;Landroid/view/View;)V
.end method

.method public static native synthetic c(Ljava/lang/String;Landroid/content/Context;)V
.end method

.method public static native d(Landroid/content/res/Resources;I)I
.end method

.method public static native e(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native f(Ljava/lang/Object;)Landroid/view/View;
.end method

.method public static native g(Ljava/lang/String;)Landroid/text/Spanned;
.end method

.method public static native h(I)Landroid/widget/LinearLayout$LayoutParams;
.end method

.method public static native i(IF)Landroid/widget/LinearLayout$LayoutParams;
.end method

.method public static native j(Ljava/lang/Object;)V
.end method

.method public static native k(Ljava/lang/Object;I)V
.end method

.method public static native synthetic l(Ljava/lang/String;Landroid/content/Context;)V
.end method

.method public static native synthetic m(Landroid/app/AlertDialog;Landroid/view/View;)V
.end method

.method public static native synthetic n(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
.end method

.method public static native o(Landroid/content/Context;Lorg/json/JSONObject;)V
.end method

.method public static native p(Landroid/content/Context;Ljava/lang/Throwable;)V
.end method
