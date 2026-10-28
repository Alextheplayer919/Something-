.class Lcom/microsoft/applications/events/SemanticContext;
.super Ljava/lang/Object;
.source "SemanticContext.java"

# interfaces
.implements Lcom/microsoft/applications/events/ISemanticContext;


# instance fields
.field private final m_nativeISemanticContextPtr:J


# direct methods
.method constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    return-void
.end method

.method private native nativeClearExperimentIds(J)V
.end method

.method private native nativeSetAppExperimentETag(JLjava/lang/String;)V
.end method

.method private native nativeSetCommonField(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
.end method

.method private native nativeSetCommonFieldString(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSetCustomField(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
.end method

.method private native nativeSetCustomFieldString(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSetEventExperimentIds(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSetNetworkCost(JI)V
.end method

.method private native nativeSetNetworkType(JI)V
.end method

.method private native nativeSetTicket(JILjava/lang/String;)V
.end method

.method private native nativeSetUserId(JLjava/lang/String;I)V
.end method


# virtual methods
.method public SetNetworkType(Lcom/microsoft/applications/events/NetworkType;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-virtual {p1}, Lcom/microsoft/applications/events/NetworkType;->getValue()I

    move-result p1

    invoke-direct {p0, v0, v1, p1}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetNetworkType(JI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "networkType is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clearExperimentIds()V
    .locals 2

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1}, Lcom/microsoft/applications/events/SemanticContext;->nativeClearExperimentIds(J)V

    return-void
.end method

.method getNativeSemanticContextPtr()J
    .locals 2

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    return-wide v0
.end method

.method public setAppEnv(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.Env"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppExperimentETag(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetAppExperimentETag(JLjava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "appExperimentETag is null or empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAppExperimentIds(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.ExperimentIds"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppExperimentImpressionId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Session.ImpressionId"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.Id"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppLanguage(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.Language"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.Name"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 1

    const-string v0, "AppInfo.Version"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCommercialId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "M365aInfo.EnrolledTenantId"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCommonField(Ljava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetCommonField(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCommonField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetCommonFieldString(JLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCustomField(Ljava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetCustomField(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCustomField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetCustomFieldString(JLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDeviceClass(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.Class"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.Id"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setDeviceMake(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.Make"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setDeviceModel(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.Model"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setEventExperimentIds(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetEventExperimentIds(JLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "experimentIds is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const/4 p2, 0x0

    sget-object p2, Lokhttp3/internal/publicsuffix/YM/Bzmxq;->LBhoaIAeZyk:Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setNetworkCost(Lcom/microsoft/applications/events/NetworkCost;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-virtual {p1}, Lcom/microsoft/applications/events/NetworkCost;->getValue()I

    move-result p1

    invoke-direct {p0, v0, v1, p1}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetNetworkCost(JI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "networkCost is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setNetworkProvider(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.NetworkProvider"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setOsBuild(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.OsBuild"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setOsName(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.OsName"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setOsVersion(Ljava/lang/String;)V
    .locals 1

    const-string v0, "DeviceInfo.OsVersion"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setTicket(Lcom/microsoft/applications/events/TicketType;Ljava/lang/String;)V
    .locals 2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-virtual {p1}, Lcom/microsoft/applications/events/TicketType;->getValue()I

    move-result p1

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetTicket(JILjava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "ticketType is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "ticketValue is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUserANID(Ljava/lang/String;)V
    .locals 1

    const-string v0, "UserInfo.ANID"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserAdvertisingId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "UserInfo.AdvertisingId"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->Identity:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, v0}, Lcom/microsoft/applications/events/SemanticContext;->setUserId(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setUserId(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/SemanticContext;->m_nativeISemanticContextPtr:J

    invoke-virtual {p2}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result p2

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/SemanticContext;->nativeSetUserId(JLjava/lang/String;I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind_Identity is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "userId is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUserLanguage(Ljava/lang/String;)V
    .locals 1

    const-string v0, "UserInfo.Language"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserMsaId(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    sget-object v0, Lorg/spongycastle/asn1/anssi/ct/nUGk;->HVoBVOZc:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserTimeZone(Ljava/lang/String;)V
    .locals 1

    const-string v0, "UserInfo.TimeZone"

    invoke-virtual {p0, v0, p1}, Lcom/microsoft/applications/events/SemanticContext;->setCommonField(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
