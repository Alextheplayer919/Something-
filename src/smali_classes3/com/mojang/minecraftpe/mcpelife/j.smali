.class public final synthetic Lcom/mojang/minecraftpe/mcpelife/j;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xa

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/j;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_10_20(Ljava/lang/Class;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/j;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/mojang/minecraftpe/mcpelife/j;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final native run()V
.end method
