.class public Lcom/mojang/minecraftpe/mcpelife/l$a;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Lcom/mojang/minecraftpe/mcpelife/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mojang/minecraftpe/mcpelife/l;->k(Ljava/lang/Object;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xc

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/l$a;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_12_90(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/l$a;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native synthetic c(Landroid/content/Context;Lorg/json/JSONObject;)V
.end method

.method public static native synthetic d(Landroid/content/Context;Ljava/lang/Exception;)V
.end method

.method public static native synthetic e(Landroid/content/Context;Ljava/lang/Throwable;)V
.end method

.method public static native synthetic f(Landroid/content/Context;Ljava/lang/Throwable;)V
.end method

.method public static native synthetic g(Landroid/content/Context;Lorg/json/JSONObject;)V
.end method

.method public static native synthetic h(Landroid/content/Context;Ljava/lang/Exception;)V
.end method


# virtual methods
.method public native a(Ljava/lang/Throwable;)V
.end method

.method public native b(Ljava/io/InputStream;)V
.end method
