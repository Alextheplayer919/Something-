.class public Lcom/pairip/VMRunner;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final PACKAGE_MANAGER_TRIES:I = 0x5

.field private static final TAG:Ljava/lang/String; = "VMRunner"

.field private static apkPath:Ljava/lang/String; = null

.field private static context:Landroid/content/Context; = null

.field private static loggingEnabled:Ljava/lang/String; = "false"

.field private static versionCode:I = 0x39f13e29


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x1b

    const-class v1, Lcom/pairip/VMRunner;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_27_00(Ljava/lang/Class;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native createInvokeRunnable(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Runnable;
.end method

.method public static native executeVM([B[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method private static native getApkFromContextPath()Ljava/util/zip/ZipFile;
.end method

.method private static native getApkPathFromResource()Ljava/lang/String;
.end method

.method public static native getContext()Landroid/content/Context;
.end method

.method private static native getVmByteCode(Ljava/lang/String;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public static native invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method private static native isDebuggingEnabled()Z
.end method

.method private static native openBaseApk()Ljava/util/zip/ZipFile;
.end method

.method private static native readByteCode(Ljava/lang/String;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method private static native readFullByteArrayFromStream(Ljava/io/InputStream;[B)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public static native setContext(Landroid/content/Context;)V
.end method

.method private static native tryOpen(Ljava/lang/String;)Ljava/util/zip/ZipFile;
.end method
