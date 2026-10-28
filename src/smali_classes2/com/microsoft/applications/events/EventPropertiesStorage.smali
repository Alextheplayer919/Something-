.class Lcom/microsoft/applications/events/EventPropertiesStorage;
.super Ljava/lang/Object;
.source "EventPropertiesStorage.java"


# instance fields
.field eventLatency:Lcom/microsoft/applications/events/EventLatency;

.field eventName:Ljava/lang/String;

.field eventPersistence:Lcom/microsoft/applications/events/EventPersistence;

.field eventPolicyBitflags:J

.field eventPopSample:D

.field eventType:Ljava/lang/String;

.field properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/events/EventProperty;",
            ">;"
        }
    .end annotation
.end field

.field propertiesPartB:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/events/EventProperty;",
            ">;"
        }
    .end annotation
.end field

.field timestampInMillis:J


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    sget-object v0, Lcom/google/gson/IyRR/lkRgnfsEss;->JIq:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventName:Ljava/lang/String;

    sget-object v0, Lcom/microsoft/applications/events/EventLatency;->Normal:Lcom/microsoft/applications/events/EventLatency;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventLatency:Lcom/microsoft/applications/events/EventLatency;

    sget-object v0, Lcom/microsoft/applications/events/EventPersistence;->Normal:Lcom/microsoft/applications/events/EventPersistence;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPersistence:Lcom/microsoft/applications/events/EventPersistence;

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPopSample:D

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPolicyBitflags:J

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->timestampInMillis:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->properties:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->propertiesPartB:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Lcom/microsoft/applications/events/EventPropertiesStorage;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventName:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventName:Ljava/lang/String;

    iget-object v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventType:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventType:Ljava/lang/String;

    iget-object v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventLatency:Lcom/microsoft/applications/events/EventLatency;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventLatency:Lcom/microsoft/applications/events/EventLatency;

    iget-object v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPersistence:Lcom/microsoft/applications/events/EventPersistence;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPersistence:Lcom/microsoft/applications/events/EventPersistence;

    iget-wide v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPopSample:D

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPopSample:D

    iget-wide v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPolicyBitflags:J

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->eventPolicyBitflags:J

    iget-wide v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->timestampInMillis:J

    iput-wide v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->timestampInMillis:J

    iget-object v0, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->properties:Ljava/util/Map;

    iput-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->properties:Ljava/util/Map;

    iget-object p1, p1, Lcom/microsoft/applications/events/EventPropertiesStorage;->propertiesPartB:Ljava/util/Map;

    iput-object p1, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->propertiesPartB:Ljava/util/Map;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "other is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method addProperties(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/events/EventProperty;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "properties is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setProperties(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/applications/events/EventProperty;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/microsoft/applications/events/EventPropertiesStorage;->properties:Ljava/util/Map;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "properties is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
