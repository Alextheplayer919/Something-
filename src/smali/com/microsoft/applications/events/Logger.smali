.class Lcom/microsoft/applications/events/Logger;
.super Ljava/lang/Object;
.source "Logger.java"

# interfaces
.implements Lcom/microsoft/applications/events/ILogger;


# instance fields
.field private m_nativePtr:J


# direct methods
.method constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-static {p0}, Lcom/microsoft/applications/events/LogManager;->registerLogger(Lcom/microsoft/applications/events/Logger;)V

    return-void
.end method

.method private native nativeGetSemanticContext(J)J
.end method

.method private native nativeLogAggregatedMetric(JLjava/lang/String;JJLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogAggregatedMetricData(JLjava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[I[D[J[JLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogAppLifecycle(JILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogEventName(JLjava/lang/String;)V
.end method

.method private native nativeLogEventProperties(JLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogFailure(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogFailureWithCategoryId(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogPageAction(JLjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogPageActionData(JLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogPageView(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogPageViewWithUri(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogSampledMetric(JLjava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogSampledMetricWithObjectId(JLjava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogSession(JILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogTrace(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private native nativeLogUserState(JIJLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V
.end method

.method private static native nativeSetContextBoolValue(JLjava/lang/String;ZI)V
.end method

.method private static native nativeSetContextDoubleValue(JLjava/lang/String;DI)V
.end method

.method private native nativeSetContextEventProperty(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
.end method

.method private static native nativeSetContextGuidValue(JLjava/lang/String;Ljava/lang/String;I)V
.end method

.method private static native nativeSetContextIntValue(JLjava/lang/String;II)V
.end method

.method private static native nativeSetContextLongValue(JLjava/lang/String;JI)V
.end method

.method private static native nativeSetContextStringValue(JLjava/lang/String;Ljava/lang/String;I)V
.end method

.method private static native nativeSetContextTimeTicksValue(JLjava/lang/String;JI)V
.end method

.method private native nativeSetLevel(JI)V
.end method

.method private native nativeSetParentContext(JJ)V
.end method

.method private setContext(Ljava/lang/String;Lcom/microsoft/applications/events/TimeTicks;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 7

    if-eqz p1, :cond_2

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iget-wide v1, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p2}, Lcom/microsoft/applications/events/TimeTicks;->getTicks()J

    move-result-wide v4

    invoke-virtual {p3}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result v6

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lcom/microsoft/applications/events/Logger;->nativeSetContextTimeTicksValue(JLjava/lang/String;JI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public SetContext(Ljava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/microsoft/applications/events/Logger;->nativeSetContextEventProperty(JLjava/lang/String;Lcom/microsoft/applications/events/EventProperty;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "prop is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public declared-synchronized clearNative()V
    .locals 2

    monitor-enter p0

    const-wide/16 v0, 0x0

    :try_start_0
    iput-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .locals 0

    invoke-static {p0}, Lcom/microsoft/applications/events/LogManager;->removeLogger(Lcom/microsoft/applications/events/Logger;)V

    invoke-virtual {p0}, Lcom/microsoft/applications/events/Logger;->clearNative()V

    return-void
.end method

.method public getNativeILoggerPtr()J
    .locals 2

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    return-wide v0
.end method

.method public getSemanticContext()Lcom/microsoft/applications/events/ISemanticContext;
    .locals 3

    new-instance v0, Lcom/microsoft/applications/events/SemanticContext;

    iget-wide v1, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-direct {p0, v1, v2}, Lcom/microsoft/applications/events/Logger;->nativeGetSemanticContext(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/microsoft/applications/events/SemanticContext;-><init>(J)V

    return-object v0
.end method

.method public logAggregatedMetric(Lcom/microsoft/applications/events/AggregatedMetricData;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 32

    move-object/from16 v0, p1

    if-eqz v0, :cond_4

    if-eqz p2, :cond_3

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v21

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v23

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v25

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->aggregates:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v12, v2, [I

    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->aggregates:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v11, v2, [D

    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->aggregates:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/microsoft/applications/events/AggregateType;

    invoke-virtual {v6}, Lcom/microsoft/applications/events/AggregateType;->getValue()I

    move-result v6

    aput v6, v12, v4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    aput-wide v5, v11, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->buckets:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v10, v2, [J

    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->buckets:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v9, v2, [J

    iget-object v2, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->buckets:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    aput-wide v5, v10, v3

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    aput-wide v4, v9, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    move-object/from16 v7, p0

    iget-wide v2, v7, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    iget-object v4, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->name:Ljava/lang/String;

    iget-wide v5, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->duration:J

    iget-wide v7, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->count:J

    move-object/from16 v16, v9

    iget-object v9, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->units:Ljava/lang/String;

    move-object/from16 v19, v10

    iget-object v10, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->instanceName:Ljava/lang/String;

    move-object/from16 v29, v19

    move-object/from16 v19, v11

    iget-object v11, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->objectClass:Ljava/lang/String;

    move-object/from16 v30, v19

    iget-object v0, v0, Lcom/microsoft/applications/events/AggregatedMetricData;->objectId:Ljava/lang/String;

    move-object/from16 v31, v12

    move-object v12, v0

    invoke-virtual {v1}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v19

    invoke-virtual {v13}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v20

    invoke-virtual {v14}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v27

    invoke-virtual {v15}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v28

    move-object/from16 v1, p0

    move-object/from16 v13, v31

    move-object/from16 v14, v30

    move-object/from16 v15, v29

    invoke-direct/range {v1 .. v28}, Lcom/microsoft/applications/events/Logger;->nativeLogAggregatedMetricData(JLjava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[I[D[J[JLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "metricData is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logAggregatedMetric(Ljava/lang/String;JJLcom/microsoft/applications/events/EventProperties;)V
    .locals 20

    if-eqz p1, :cond_2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p6, :cond_1

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v12

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v14

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v16

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v6, p0

    iget-wide v1, v6, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v10

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v11

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-wide/from16 v4, p2

    move-wide/from16 v6, p4

    invoke-direct/range {v0 .. v19}, Lcom/microsoft/applications/events/Logger;->nativeLogAggregatedMetric(JLjava/lang/String;JJLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x0

    sget-object v1, Lkotlinx/coroutines/flow/internal/TZBP/zOnhUZr;->jpfZaifmJG:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logAppLifecycle(Lcom/microsoft/applications/events/AppLifecycleState;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 20

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v8

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v12

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v15, p0

    iget-wide v6, v15, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/AppLifecycleState;->getValue()I

    move-result v14

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v16

    invoke-virtual {v1}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v17

    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p0

    move-wide v1, v6

    move v3, v14

    move/from16 v6, v16

    move/from16 v7, v17

    move-object/from16 v14, v18

    move-object/from16 v15, v19

    invoke-direct/range {v0 .. v15}, Lcom/microsoft/applications/events/Logger;->nativeLogAppLifecycle(JILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "state is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logEvent(Lcom/microsoft/applications/events/EventProperties;)V
    .locals 19

    if-eqz p1, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v7

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v9

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v11

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v15, p0

    iget-wide v13, v15, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v6

    invoke-virtual {v1}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v16

    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v17

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, p0

    move-wide v1, v13

    move v5, v6

    move/from16 v6, v16

    move-object/from16 v13, v17

    move-object/from16 v14, v18

    invoke-direct/range {v0 .. v14}, Lcom/microsoft/applications/events/Logger;->nativeLogEventProperties(JLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    move-object/from16 v15, p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logEvent(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validateEventName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/microsoft/applications/events/Logger;->nativeLogEventName(JLjava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "name is null or invalid"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public logFailure(Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 17

    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v9

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v11

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v13

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v8, p0

    iget-wide v1, v8, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v7

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v0

    move v8, v0

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    move-object v3, v15

    move-object v15, v0

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v0 .. v16}, Lcom/microsoft/applications/events/Logger;->nativeLogFailure(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "detail is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "signature is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 19

    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p5, :cond_1

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v11

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v13

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v15

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v6, p0

    iget-wide v1, v6, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v9

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v10

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v17

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v0 .. v18}, Lcom/microsoft/applications/events/Logger;->nativeLogFailureWithCategoryId(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "detail is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "signature is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logPageAction(Lcom/microsoft/applications/events/PageActionData;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 27

    move-object/from16 v0, p1

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v18

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v19

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v21

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v23

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v12, p0

    iget-wide v2, v12, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    iget-object v4, v0, Lcom/microsoft/applications/events/PageActionData;->pageViewId:Ljava/lang/String;

    iget-object v5, v0, Lcom/microsoft/applications/events/PageActionData;->actionType:Lcom/microsoft/applications/events/ActionType;

    invoke-virtual {v5}, Lcom/microsoft/applications/events/ActionType;->getValue()I

    move-result v5

    iget-object v6, v0, Lcom/microsoft/applications/events/PageActionData;->rawActionType:Lcom/microsoft/applications/events/RawActionType;

    invoke-virtual {v6}, Lcom/microsoft/applications/events/RawActionType;->getValue()I

    move-result v6

    iget-object v7, v0, Lcom/microsoft/applications/events/PageActionData;->inputDeviceType:Lcom/microsoft/applications/events/InputDeviceType;

    invoke-virtual {v7}, Lcom/microsoft/applications/events/InputDeviceType;->getValue()I

    move-result v7

    iget-object v8, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemId:Ljava/lang/String;

    iget-object v9, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceName:Ljava/lang/String;

    iget-object v10, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceCategory:Ljava/lang/String;

    iget-object v11, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceCollection:Ljava/lang/String;

    iget-object v12, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemLayoutContainer:Ljava/lang/String;

    move-object/from16 v17, v13

    iget-short v13, v0, Lcom/microsoft/applications/events/PageActionData;->targetItemLayoutRank:S

    move-object/from16 v26, v17

    iget-object v0, v0, Lcom/microsoft/applications/events/PageActionData;->destinationUri:Ljava/lang/String;

    move-object/from16 v25, v14

    move-object v14, v0

    invoke-virtual {v1}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v17

    invoke-virtual/range {v18 .. v18}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v18

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v25

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v26

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v26}, Lcom/microsoft/applications/events/Logger;->nativeLogPageActionData(JLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pageActionData is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logPageAction(Ljava/lang/String;Lcom/microsoft/applications/events/ActionType;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 17

    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v9

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v11

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v13

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v15, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v7, p0

    iget-wide v1, v7, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/ActionType;->getValue()I

    move-result v4

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v0

    move v7, v0

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v0

    move-object v3, v8

    move v8, v0

    invoke-virtual {v15}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v16}, Lcom/microsoft/applications/events/Logger;->nativeLogPageAction(JLjava/lang/String;ILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "actionType is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pageViewId is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logPageView(Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 17

    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v9

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v11

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v13

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v8, p0

    iget-wide v1, v8, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v7

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v0

    move v8, v0

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    move-object v3, v15

    move-object v15, v0

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v0 .. v16}, Lcom/microsoft/applications/events/Logger;->nativeLogPageView(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pageName is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "id is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logPageView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 20

    if-eqz p1, :cond_6

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-eqz p2, :cond_5

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    if-eqz p3, :cond_4

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p4, :cond_3

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p5, :cond_2

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p6, :cond_1

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v12

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v14

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v16

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p6 .. p6}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v7, p0

    iget-wide v1, v7, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v10

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v11

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v0 .. v19}, Lcom/microsoft/applications/events/Logger;->nativeLogPageViewWithUri(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "referrerUri is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "uri is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "category is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pageName is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "id is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logSampledMetric(Ljava/lang/String;DLjava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 19

    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p4, :cond_2

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p5, :cond_1

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v11

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v13

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v15

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p5 .. p5}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v6, p0

    iget-wide v1, v6, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v9

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v10

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v17

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-wide/from16 v4, p2

    move-object/from16 v6, p4

    invoke-direct/range {v0 .. v18}, Lcom/microsoft/applications/events/Logger;->nativeLogSampledMetric(JLjava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "units is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logSampledMetric(Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 22

    if-eqz p1, :cond_6

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-eqz p4, :cond_5

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    if-eqz p5, :cond_4

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p6, :cond_3

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p7, :cond_2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p8, :cond_1

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v3

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v14

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v16

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v18

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p8 .. p8}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v9, p0

    iget-wide v1, v9, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v12

    invoke-virtual {v3}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v13

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v20

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-wide/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v0 .. v21}, Lcom/microsoft/applications/events/Logger;->nativeLogSampledMetricWithObjectId(JLjava/lang/String;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "objectId is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "objectClass is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "instanceName is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "units is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logSession(Lcom/microsoft/applications/events/SessionState;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 20

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v8

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v12

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v15, p0

    iget-wide v6, v15, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/SessionState;->getValue()I

    move-result v14

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v16

    invoke-virtual {v1}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v17

    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v18

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p0

    move-wide v1, v6

    move v3, v14

    move/from16 v6, v16

    move/from16 v7, v17

    move-object/from16 v14, v18

    move-object/from16 v15, v19

    invoke-direct/range {v0 .. v15}, Lcom/microsoft/applications/events/Logger;->nativeLogSession(JILjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "properties is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "state is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logTrace(Lcom/microsoft/applications/events/TraceLevel;Ljava/lang/String;Lcom/microsoft/applications/events/EventProperties;)V
    .locals 17

    if-eqz p2, :cond_2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_1

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v4

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v9

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v11

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v13

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v7, p0

    iget-wide v1, v7, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/TraceLevel;->getValue()I

    move-result v3

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v0

    move v7, v0

    invoke-virtual {v4}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v0

    move-object v4, v8

    move v8, v0

    invoke-virtual {v15}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v4, p2

    invoke-direct/range {v0 .. v16}, Lcom/microsoft/applications/events/Logger;->nativeLogTrace(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "level is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "message is null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public logUserState(Lcom/microsoft/applications/events/UserState;JLcom/microsoft/applications/events/EventProperties;)V
    .locals 18

    if-eqz p1, :cond_1

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getLatency()Lcom/microsoft/applications/events/EventLatency;

    move-result-object v0

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getPersistence()Lcom/microsoft/applications/events/EventPersistence;

    move-result-object v4

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getPopSample()D

    move-result-wide v10

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getPolicyBitFlags()J

    move-result-wide v12

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getTimestamp()J

    move-result-wide v14

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p4 .. p4}, Lcom/microsoft/applications/events/EventProperties;->getProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/microsoft/applications/events/EventProperty;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v8, p0

    iget-wide v1, v8, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual/range {p1 .. p1}, Lcom/microsoft/applications/events/UserState;->getValue()I

    move-result v3

    invoke-virtual {v0}, Lcom/microsoft/applications/events/EventLatency;->getValue()I

    move-result v0

    move v8, v0

    invoke-virtual {v4}, Lcom/microsoft/applications/events/EventPersistence;->getValue()I

    move-result v0

    move-object v4, v9

    move v9, v0

    invoke-virtual {v5}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v16

    invoke-virtual {v4}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p0

    move-wide/from16 v4, p2

    invoke-direct/range {v0 .. v17}, Lcom/microsoft/applications/events/Logger;->nativeLogUserState(JIJLjava/lang/String;Ljava/lang/String;IIDJJ[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x0

    sget-object v1, Lkotlin/io/path/GVx/PeTd;->NddzlcZgD:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContext(Ljava/lang/String;D)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;DLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;DLcom/microsoft/applications/events/PiiKind;)V
    .locals 7

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p4, :cond_0

    iget-wide v1, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p4}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result v6

    move-object v3, p1

    move-wide v4, p2

    invoke-static/range {v1 .. v6}, Lcom/microsoft/applications/events/Logger;->nativeSetContextDoubleValue(JLjava/lang/String;DI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContext(Ljava/lang/String;I)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;ILcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;ILcom/microsoft/applications/events/PiiKind;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p3}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/microsoft/applications/events/Logger;->nativeSetContextIntValue(JLjava/lang/String;II)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContext(Ljava/lang/String;J)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;JLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;JLcom/microsoft/applications/events/PiiKind;)V
    .locals 7

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p4, :cond_0

    iget-wide v1, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p4}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result v6

    move-object v3, p1

    move-wide v4, p2

    invoke-static/range {v1 .. v6}, Lcom/microsoft/applications/events/Logger;->nativeSetContextLongValue(JLjava/lang/String;JI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContext(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;Ljava/lang/String;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 2

    if-eqz p1, :cond_2

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p3}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/microsoft/applications/events/Logger;->nativeSetContextStringValue(JLjava/lang/String;Ljava/lang/String;I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContext(Ljava/lang/String;Ljava/util/Date;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;Ljava/util/Date;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 1

    new-instance v0, Lcom/microsoft/applications/events/TimeTicks;

    invoke-direct {v0, p2}, Lcom/microsoft/applications/events/TimeTicks;-><init>(Ljava/util/Date;)V

    invoke-direct {p0, p1, v0, p3}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;Lcom/microsoft/applications/events/TimeTicks;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;Ljava/util/UUID;)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;Ljava/util/UUID;Lcom/microsoft/applications/events/PiiKind;)V
    .locals 2

    if-eqz p1, :cond_2

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/microsoft/applications/events/Logger;->nativeSetContextGuidValue(JLjava/lang/String;Ljava/lang/String;I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "value is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContext(Ljava/lang/String;Z)V
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/PiiKind;->None:Lcom/microsoft/applications/events/PiiKind;

    invoke-virtual {p0, p1, p2, v0}, Lcom/microsoft/applications/events/Logger;->setContext(Ljava/lang/String;ZLcom/microsoft/applications/events/PiiKind;)V

    return-void
.end method

.method public setContext(Ljava/lang/String;ZLcom/microsoft/applications/events/PiiKind;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/microsoft/applications/events/Utils;->validatePropertyName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p3}, Lcom/microsoft/applications/events/PiiKind;->getValue()I

    move-result p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/microsoft/applications/events/Logger;->nativeSetContextBoolValue(JLjava/lang/String;ZI)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "piiKind is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name is null or invalid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLevel(Lcom/microsoft/applications/events/DiagnosticLevel;)V
    .locals 2

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    invoke-virtual {p1}, Lcom/microsoft/applications/events/DiagnosticLevel;->getValue()I

    move-result p1

    invoke-direct {p0, v0, v1, p1}, Lcom/microsoft/applications/events/Logger;->nativeSetLevel(JI)V

    return-void
.end method

.method public setParentContext(Lcom/microsoft/applications/events/ISemanticContext;)V
    .locals 4

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/microsoft/applications/events/Logger;->m_nativePtr:J

    check-cast p1, Lcom/microsoft/applications/events/SemanticContext;

    invoke-virtual {p1}, Lcom/microsoft/applications/events/SemanticContext;->getNativeSemanticContextPtr()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/microsoft/applications/events/Logger;->nativeSetParentContext(JJ)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "context is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
