.class public Lcom/mojang/minecraftpe/mcpelife/b;
.super Ljava/lang/Object;
.source "Dex2C"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mojang/minecraftpe/mcpelife/b$a;
    }
.end annotation


# instance fields
.field public a:Ljava/net/HttpURLConnection;

.field public final b:Lcom/mojang/minecraftpe/mcpelife/b$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x2

    const-class v1, Lcom/mojang/minecraftpe/mcpelife/b;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_2_30(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mojang/minecraftpe/mcpelife/b$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mojang/minecraftpe/mcpelife/b;->a:Ljava/net/HttpURLConnection;

    iput-object p2, p0, Lcom/mojang/minecraftpe/mcpelife/b;->b:Lcom/mojang/minecraftpe/mcpelife/b$a;

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iput-object p1, p0, Lcom/mojang/minecraftpe/mcpelife/b;->a:Ljava/net/HttpURLConnection;

    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-static {v0}, Lcom/mojang/minecraftpe/mcpelife/y;->decode([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-interface {p2, p1}, Lcom/mojang/minecraftpe/mcpelife/b$a;->a(Ljava/lang/Throwable;)V

    :goto_0
    return-void

    :array_0
    .array-data 1
        0x52t
        0x30t
        0x56t
        0x55t
    .end array-data
.end method


# virtual methods
.method public final native a()Z
.end method

.method public native b()V
.end method
