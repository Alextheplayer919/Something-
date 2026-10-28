.class public Lcom/microsoft/applications/events/EventProperty;
.super Ljava/lang/Object;
.source "EventProperty.java"


# instance fields
.field private m_category:Lcom/microsoft/applications/events/DataCategory;

.field private m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

.field private m_piiKind:Lcom/microsoft/applications/events/PiiKind;


# direct methods
.method public constructor <init>(D)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(DLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(DLcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(DLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(DLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p3, :cond_1

    if-eqz p4, :cond_0

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p4, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p3, Lcom/microsoft/applications/events/EventPropertyDoubleValue;

    invoke-direct {p3, p1, p2}, Lcom/microsoft/applications/events/EventPropertyDoubleValue;-><init>(D)V

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(I)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(ILcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(ILcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(ILcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(ILcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 2

    int-to-long v0, p1

    invoke-direct {p0, v0, v1, p2, p3}, Lcom/microsoft/applications/events/EventProperty;-><init>(JLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(JLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(JLcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(JLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(JLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p3, :cond_1

    if-eqz p4, :cond_0

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p4, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p3, Lcom/microsoft/applications/events/EventPropertyLongValue;

    invoke-direct {p3, p1, p2}, Lcom/microsoft/applications/events/EventPropertyLongValue;-><init>(J)V

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private constructor <init>(Lcom/microsoft/applications/events/TimeTicks;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyTimeTicksValue;

    invoke-virtual {p1}, Lcom/microsoft/applications/events/TimeTicks;->getTicks()J

    move-result-wide v0

    invoke-direct {p2, v0, v1}, Lcom/microsoft/applications/events/EventPropertyTimeTicksValue;-><init>(J)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyStringValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyStringValue;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    new-instance v0, Lcom/microsoft/applications/events/TimeTicks;

    invoke-direct {v0, p1}, Lcom/microsoft/applications/events/TimeTicks;-><init>(Ljava/util/Date;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/microsoft/applications/events/EventProperty;-><init>(Lcom/microsoft/applications/events/TimeTicks;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyGuidValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyGuidValue;-><init>(Ljava/util/UUID;)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Z)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(ZLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>(ZLcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>(ZLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>(ZLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyBooleanValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyBooleanValue;-><init>(Z)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>([D)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([DLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>([DLcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([DLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>([DLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    array-length v0, p1

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyDoubleArrayValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyDoubleArrayValue;-><init>([D)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>([J)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([JLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>([JLcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([JLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>([JLcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    array-length v0, p1

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyLongArrayValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyLongArrayValue;-><init>([J)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    array-length v0, p1

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyStringArrayValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyStringArrayValue;-><init>([Ljava/lang/String;)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>([Ljava/util/UUID;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-direct {p0, p1, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public constructor <init>([Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    invoke-direct {p0, p1, p2, v0}, Lcom/microsoft/applications/events/EventProperty;-><init>([Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V

    return-void
.end method

.method public constructor <init>([Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;Lcom/microsoft/applications/events/DataCategory;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/microsoft/applications/events/DataCategory;->PartC:Lcom/microsoft/applications/events/DataCategory;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    if-eqz p1, :cond_2

    array-length v0, p1

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    iput-object p3, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    new-instance p2, Lcom/microsoft/applications/events/EventPropertyGuidArrayValue;

    invoke-direct {p2, p1}, Lcom/microsoft/applications/events/EventPropertyGuidArrayValue;-><init>([Ljava/util/UUID;)V

    iput-object p2, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "category is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method getDataCategory()Lcom/microsoft/applications/events/DataCategory;
    .locals 1

    iget-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    return-object v0
.end method

.method getDataCategoryValue()I
    .locals 1

    iget-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_category:Lcom/microsoft/applications/events/DataCategory;

    invoke-virtual {v0}, Lcom/microsoft/applications/events/DataCategory;->getValue()I

    move-result v0

    return v0
.end method

.method public getEventPropertyValue()Lcom/microsoft/applications/events/EventPropertyValue;
    .locals 1

    iget-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_eventPropertyValue:Lcom/microsoft/applications/events/EventPropertyValue;

    return-object v0
.end method

.method public getPiiKind()Lcom/microsoft/applications/events/PiiKind;
    .locals 1

    iget-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    return-object v0
.end method

.method getPiiKindValue()I
    .locals 1

    iget-object v0, p0, Lcom/microsoft/applications/events/EventProperty;->m_piiKind:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {v0}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result v0

    return v0
.end method
