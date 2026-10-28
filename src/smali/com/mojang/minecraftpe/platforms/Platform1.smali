.class public Lcom/mojang/minecraftpe/platforms/Platform1;
.super Landroid/app/Activity;
.source "Platform1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mojang/minecraftpe/platforms/Platform1$100000000;,
        Lcom/mojang/minecraftpe/platforms/Platform1$100000001;
    }
.end annotation


# static fields
.field public static manager:Landroid/view/WindowManager;

.field public static vParams:Landroid/view/WindowManager$LayoutParams;

.field public static vTouch:Landroid/view/View;

.field public static wParams:Landroid/view/WindowManager$LayoutParams;

.field public static windowManager:Landroid/view/WindowManager;

.field public static xfqManager:Landroid/view/WindowManager;

.field public static 真实宽:I

.field public static 真实高:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 161
    move-object v0, p0

    move-object v2, v0

    invoke-direct {v2}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static getAttributes(Landroid/content/Context;Z)Landroid/view/WindowManager$LayoutParams;
    .locals 12

    .prologue
    .line 112
    move-object v0, p0

    move v1, p1

    new-instance v9, Landroid/view/WindowManager$LayoutParams;

    move-object v11, v9

    move-object v9, v11

    move-object v10, v11

    invoke-direct {v10}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    move-object v3, v9

    .line 113
    const/4 v9, 0x0

    move v4, v9

    .line 114
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0xb

    if-lt v9, v10, :cond_0

    .line 115
    const/high16 v9, 0x800000

    move v4, v9

    .line 117
    :cond_0
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v10, 0x3

    if-lt v9, v10, :cond_1

    .line 118
    move v9, v4

    const/high16 v10, 0x20000

    or-int/2addr v9, v10

    move v4, v9

    .line 122
    :cond_1
    const/4 v9, -0x2

    move v5, v9

    .line 123
    const/4 v9, -0x2

    move v6, v9

    .line 125
    move v9, v1

    if-eqz v9, :cond_2

    .line 126
    const/4 v9, -0x1

    move v5, v9

    .line 127
    const/4 v9, -0x1

    move v6, v9

    .line 130
    :cond_2
    move-object v9, v3

    move v10, v5

    iput v10, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 131
    move-object v9, v3

    move v10, v6

    iput v10, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 133
    move-object v9, v3

    const/4 v10, 0x0

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 134
    move-object v9, v3

    const/4 v10, 0x0

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 136
    move-object v9, v3

    const/4 v10, 0x2

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 139
    const v9, 0x2800108

    move v10, v4

    or-int/2addr v9, v10

    move v7, v9

    .line 144
    move v9, v1

    if-eqz v9, :cond_5

    .line 145
    move v9, v7

    const/16 v10, 0x30

    or-int/lit8 v9, v9, 0x30

    move v7, v9

    .line 150
    :goto_0
    move-object v9, v3

    move v10, v7

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 152
    move-object v9, v3

    const/4 v10, 0x1

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 154
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1c

    if-lt v9, v10, :cond_3

    .line 155
    move-object v9, v3

    const/4 v10, 0x1

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 158
    :cond_3
    move v9, v1

    if-nez v9, :cond_4

    move-object v9, v3

    const/16 v10, 0x33

    iput v10, v9, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 160
    :cond_4
    move-object v9, v3

    move-object v0, v9

    return-object v0

    .line 147
    :cond_5
    move v9, v7

    const/16 v10, 0x8

    or-int/lit8 v9, v9, 0x8

    move v7, v9

    goto :goto_0
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    move-object v1, p0

    move-object v6, v1

    const-string v7, "demo.dat"

    invoke-static {v6, v7}, Lcom/mojang/minecraftpe/platforms/Platform1;->loadLib(Landroid/content/Context;Ljava/lang/String;)V

    .line 52
    move-object v6, v1

    check-cast v6, Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    sput-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->manager:Landroid/view/WindowManager;

    .line 53
    move-object v6, v1

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/mojang/minecraftpe/platforms/Platform1;->getAttributes(Landroid/content/Context;Z)Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    sput-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    .line 54
    move-object v6, v1

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/mojang/minecraftpe/platforms/Platform1;->getAttributes(Landroid/content/Context;Z)Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    sput-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->wParams:Landroid/view/WindowManager$LayoutParams;

    .line 55
    new-instance v6, Lcom/mojang/minecraftpe/platforms/Platform2;

    move-object v10, v6

    move-object v6, v10

    move-object v7, v10

    move-object v8, v1

    invoke-direct {v7, v8}, Lcom/mojang/minecraftpe/platforms/Platform2;-><init>(Landroid/content/Context;)V

    move-object v3, v6

    .line 56
    new-instance v6, Landroid/view/View;

    move-object v10, v6

    move-object v6, v10

    move-object v7, v10

    move-object v8, v1

    invoke-direct {v7, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    sput-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->vTouch:Landroid/view/View;

    .line 57
    sget-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->manager:Landroid/view/WindowManager;

    sget-object v7, Lcom/mojang/minecraftpe/platforms/Platform1;->vTouch:Landroid/view/View;

    sget-object v8, Lcom/mojang/minecraftpe/platforms/Platform1;->vParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v6, v7, v8}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    sget-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->manager:Landroid/view/WindowManager;

    move-object v7, v3

    sget-object v8, Lcom/mojang/minecraftpe/platforms/Platform1;->wParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v6, v7, v8}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    sget-object v6, Lcom/mojang/minecraftpe/platforms/Platform1;->vTouch:Landroid/view/View;

    new-instance v7, Lcom/mojang/minecraftpe/platforms/Platform1$100000000;

    move-object v10, v7

    move-object v7, v10

    move-object v8, v10

    invoke-direct {v8}, Lcom/mojang/minecraftpe/platforms/Platform1$100000000;-><init>()V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 76
    new-instance v6, Landroid/os/Handler;

    move-object v10, v6

    move-object v6, v10

    move-object v7, v10

    invoke-direct {v7}, Landroid/os/Handler;-><init>()V

    move-object v4, v6

    .line 77
    move-object v6, v4

    new-instance v7, Lcom/mojang/minecraftpe/platforms/Platform1$100000001;

    move-object v10, v7

    move-object v7, v10

    move-object v8, v10

    move-object v9, v4

    invoke-direct {v8, v9}, Lcom/mojang/minecraftpe/platforms/Platform1$100000001;-><init>(Landroid/os/Handler;)V

    const/16 v8, 0x14

    int-to-long v8, v8

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v6

    return-void
.end method

.method public static loadLib(Landroid/content/Context;Ljava/lang/String;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 95
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v11, v0

    :try_start_0
    invoke-virtual {v11}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v11

    move-object v3, v11

    .line 96
    move-object v11, v3

    new-instance v12, Ljava/lang/StringBuffer;

    move-object v15, v12

    move-object v12, v15

    move-object v13, v15

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "assets/icu/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object v13, v1

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v11

    move-object v4, v11

    .line 97
    move-object v11, v0

    const-string v12, "lib"

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v11

    move-object v5, v11

    .line 98
    new-instance v11, Ljava/io/File;

    move-object v15, v11

    move-object v11, v15

    move-object v12, v15

    move-object v13, v5

    move-object v14, v1

    invoke-direct {v12, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v6, v11

    .line 99
    new-instance v11, Ljava/io/FileOutputStream;

    move-object v15, v11

    move-object v11, v15

    move-object v12, v15

    move-object v13, v6

    invoke-direct {v12, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v7, v11

    .line 100
    const/16 v11, 0x400

    new-array v11, v11, [B

    move-object v8, v11

    .line 102
    :goto_0
    move-object v11, v4

    move-object v12, v8

    invoke-virtual {v11, v12}, Ljava/io/InputStream;->read([B)I

    move-result v11

    move v15, v11

    move v11, v15

    move v12, v15

    move v9, v12

    const/4 v12, 0x0

    if-gt v11, v12, :cond_0

    .line 105
    move-object v11, v7

    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 106
    move-object v11, v4

    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 107
    move-object v11, v6

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/System;->load(Ljava/lang/String;)V

    :goto_1
    return-void

    .line 103
    :cond_0
    move-object v11, v7

    move-object v12, v8

    const/4 v13, 0x0

    move v14, v9

    invoke-virtual {v11, v12, v13, v14}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 107
    :catch_0
    move-exception v11

    move-object v3, v11

    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Override;
    .end annotation

    .prologue
    .line 46
    move-object v0, p0

    move-object v1, p1

    move-object v3, v0

    move-object v4, v1

    invoke-super {v3, v4}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    move-object v3, v0

    invoke-static {v3}, Lcom/mojang/minecraftpe/platforms/Platform1;->initialize(Landroid/content/Context;)V

    return-void
.end method
