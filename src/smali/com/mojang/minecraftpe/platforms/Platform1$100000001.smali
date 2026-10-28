.class Lcom/mojang/minecraftpe/platforms/Platform1$100000001;
.super Ljava/lang/Object;
.source "Platform1.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mojang/minecraftpe/platforms/Platform1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x20
    name = "100000001"
.end annotation


# instance fields
.field private final val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 5

    move-object v0, p0

    move-object v1, p1

    move-object v3, v0

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    move-object v3, v0

    move-object v4, v1

    iput-object v4, v3, Lcom/mojang/minecraftpe/platforms/Platform1$100000001;->val$handler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Override;
    .end annotation

    .prologue
    .line 81
    move-object v0, p0

    :try_start_0
    invoke-static {}, Lcom/mojang/minecraftpe/platforms/Platform2;->getWindowRect()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\|"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    move-object v2, v4

    .line 82
    sget-object v4, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    move-object v5, v2

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 83
    sget-object v4, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    move-object v5, v2

    const/4 v6, 0x1

    aget-object v5, v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 84
    sget-object v4, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    move-object v5, v2

    const/4 v6, 0x2

    aget-object v5, v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 85
    sget-object v4, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    move-object v5, v2

    const/4 v6, 0x3

    aget-object v5, v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 86
    sget-object v4, Lcom/mojang/minecraftpe/platforms/Platform1;->manager:Landroid/view/WindowManager;

    sget-object v5, Lcom/mojang/minecraftpe/platforms/Platform1;->vTouch:Landroid/view/View;

    sget-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v4, v5, v6}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :goto_0
    move-object v4, v0

    iget-object v4, v4, Lcom/mojang/minecraftpe/platforms/Platform1$100000001;->val$handler:Landroid/os/Handler;

    move-object v5, v0

    const/16 v6, 0x14

    int-to-long v6, v6

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v4

    return-void

    .line 86
    :catch_0
    move-exception v4

    move-object v2, v4

    goto :goto_0
.end method
