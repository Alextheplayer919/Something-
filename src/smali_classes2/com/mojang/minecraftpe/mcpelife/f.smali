.class public final synthetic Lcom/mojang/minecraftpe/mcpelife/f;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x6

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/f;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_6_20(Ljava/lang/Class;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/f;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/mojang/minecraftpe/mcpelife/f;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final native run()V
.end method
