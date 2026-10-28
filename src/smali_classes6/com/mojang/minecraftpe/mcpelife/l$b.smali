.class public Lcom/mojang/minecraftpe/mcpelife/l$b;
.super Landroid/view/ViewOutlineProvider;
.source "Dex2C"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mojang/minecraftpe/mcpelife/l;->f(Ljava/lang/Object;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xd

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/l$b;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_13_20(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public native getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
.end method
