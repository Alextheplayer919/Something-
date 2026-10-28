.class public Lcom/mojang/minecraftpe/platforms/Platform2;
.super Landroid/opengl/GLSurfaceView;
.source "Platform2.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# static fields
.field public static fontData:[B


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 10

    .prologue
    .line 14
    move-object v0, p0

    move-object v1, p1

    move-object v3, v0

    move-object v4, v1

    invoke-direct {v3, v4}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 15
    move-object v3, v0

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x8

    const/16 v7, 0x8

    const/16 v8, 0x10

    const/4 v9, 0x0

    invoke-virtual/range {v3 .. v9}, Landroid/opengl/GLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 16
    move-object v3, v0

    invoke-virtual {v3}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v3

    const/4 v4, -0x3

    invoke-interface {v3, v4}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 17
    move-object v3, v0

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/opengl/GLSurfaceView;->setEGLContextClientVersion(I)V

    .line 18
    move-object v3, v0

    move-object v4, v0

    invoke-virtual {v3, v4}, Landroid/opengl/GLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 19
    move-object v3, v0

    move-object v4, v1

    iput-object v4, v3, Lcom/mojang/minecraftpe/platforms/Platform2;->context:Landroid/content/Context;

    return-void
.end method

.method public static native MotionEventClick(ZFF)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZFF)V"
        }
    .end annotation
.end method

.method public static native getWindowRect()Ljava/lang/String;
.end method

.method public static native imgui_Shutdown()V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation
.end method

.method public static native init()V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation
.end method

.method public static native resize(II)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation
.end method

.method public static native step()V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation
.end method


# virtual methods
.method protected onDetachedFromWindow()V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Override;
    .end annotation

    .prologue
    .line 36
    move-object v0, p0

    move-object v2, v0

    invoke-super {v2}, Landroid/opengl/GLSurfaceView;->onDetachedFromWindow()V

    .line 37
    invoke-static {}, Lcom/mojang/minecraftpe/platforms/Platform2;->imgui_Shutdown()V

    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/microedition/khronos/opengles/GL10;",
            ")V"
        }
    .end annotation

    .prologue
    .line 23
    invoke-static {}, Lcom/mojang/minecraftpe/platforms/Platform2;->step()V

    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/microedition/khronos/opengles/GL10;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 27
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v2

    move v6, v3

    invoke-static {v5, v6}, Lcom/mojang/minecraftpe/platforms/Platform2;->resize(II)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/microedition/khronos/opengles/GL10;",
            "Ljavax/microedition/khronos/egl/EGLConfig;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    invoke-static {}, Lcom/mojang/minecraftpe/platforms/Platform2;->init()V

    return-void
.end method
