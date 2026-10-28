.class public final Lorg/conscrypt/OpenSSLRandom;
.super Ljava/security/SecureRandomSpi;
.source "OpenSSLRandom.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x760c2179bb8f6dadL


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/security/SecureRandomSpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGenerateSeed(I)[B
    .locals 0

    new-array p1, p1, [B

    invoke-static {p1}, Lorg/conscrypt/NativeCrypto;->RAND_bytes([B)V

    return-object p1
.end method

.method protected engineNextBytes([B)V
    .locals 0

    invoke-static {p1}, Lorg/conscrypt/NativeCrypto;->RAND_bytes([B)V

    return-void
.end method

.method protected engineSetSeed([B)V
    .locals 1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "seed == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
