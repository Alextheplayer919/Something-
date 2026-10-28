.class Lcom/mojang/minecraftpe/platforms/Platform1$100000000;
.super Ljava/lang/Object;
.source "Platform1.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mojang/minecraftpe/platforms/Platform1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x20
    name = "100000000"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 3

    move-object v0, p0

    move-object v2, v0

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .annotation runtime Ljava/lang/Override;
    .end annotation

    .prologue
    .line 63
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, v2

    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    move v4, v6

    .line 64
    move v6, v4

    packed-switch v6, :pswitch_data_0

    .line 73
    :goto_0
    const/4 v6, 0x0

    move v0, v6

    return v0

    .line 68
    :pswitch_0
    move v6, v4

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    const/4 v6, 0x0

    :goto_1
    move-object v7, v2

    invoke-virtual {v7}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    move-object v8, v2

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    invoke-static {v6, v7, v8}, Lcom/mojang/minecraftpe/platforms/Platform2;->MotionEventClick(ZFF)V

    .line 69
    goto :goto_0

    .line 68
    :cond_0
    const/4 v6, 0x1

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
