.class Lcom/microsoft/applications/events/PowerInfoReceiver;
.super Landroid/content/BroadcastReceiver;
.source "HttpClient.java"


# instance fields
.field private final m_parent:Lcom/microsoft/applications/events/HttpClient;


# direct methods
.method constructor <init>(Lcom/microsoft/applications/events/HttpClient;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lcom/microsoft/applications/events/PowerInfoReceiver;->m_parent:Lcom/microsoft/applications/events/HttpClient;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string/jumbo p1, "status"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move p1, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_2

    const-string v0, "battery_low"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    :cond_2
    iget-object p2, p0, Lcom/microsoft/applications/events/PowerInfoReceiver;->m_parent:Lcom/microsoft/applications/events/HttpClient;

    invoke-virtual {p2, p1, v1}, Lcom/microsoft/applications/events/HttpClient;->onPowerChange(ZZ)V

    return-void
.end method
