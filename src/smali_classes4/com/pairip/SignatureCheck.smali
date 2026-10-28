.class public Lcom/pairip/SignatureCheck;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static final ALLOWLISTED_SIG:Ljava/lang/String; = "Vn3kj4pUblROi2S+QfRRL9nhsaO2uoHQg6+dpEtxdTE="

.field private static final TAG:Ljava/lang/String; = "SignatureCheck"

.field private static expectedLegacyUpgradedSignature:Ljava/lang/String; = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w="

.field private static expectedSignature:Ljava/lang/String; = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w="

.field private static expectedTestSignature:Ljava/lang/String; = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w="


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x1a

    const-class v1, Lcom/pairip/SignatureCheck;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_26_30(Ljava/lang/Class;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native verifyIntegrity(Landroid/content/Context;)V
.end method

.method public static native verifySignatureMatches(Ljava/lang/String;)Z
.end method
