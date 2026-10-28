.class public final synthetic Lcom/mojang/minecraftpe/mcpelife/g;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Landroid/app/AlertDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x7

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/g;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_7_20(Ljava/lang/Class;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/g;->a:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final native onClick(Landroid/view/View;)V
.end method
