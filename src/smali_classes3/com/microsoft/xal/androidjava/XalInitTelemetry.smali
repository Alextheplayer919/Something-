.class public Lcom/microsoft/xal/androidjava/XalInitTelemetry;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "XalInitTelemetry.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static initOneDS()V
    .locals 1

    const-string v0, "maesdk"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method static startHttpClient(Landroid/content/Context;)V
    .locals 1

    new-instance v0, Lcom/microsoft/applications/events/HttpClient;

    invoke-direct {v0, p0}, Lcom/microsoft/applications/events/HttpClient;-><init>(Landroid/content/Context;)V

    return-void
.end method
