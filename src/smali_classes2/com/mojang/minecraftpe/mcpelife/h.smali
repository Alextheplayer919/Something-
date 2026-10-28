.class public final synthetic Lcom/mojang/minecraftpe/mcpelife/h;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x8

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/h;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_8_20(Ljava/lang/Class;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/h;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/mojang/minecraftpe/mcpelife/h;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final native onClick(Landroid/view/View;)V
.end method
