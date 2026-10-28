.class public final enum Lcom/microsoft/applications/events/TraceLevel;
.super Ljava/lang/Enum;
.source "TraceLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/microsoft/applications/events/TraceLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/microsoft/applications/events/TraceLevel;

.field public static final enum Error:Lcom/microsoft/applications/events/TraceLevel;

.field public static final enum Information:Lcom/microsoft/applications/events/TraceLevel;

.field public static final enum None:Lcom/microsoft/applications/events/TraceLevel;

.field public static final enum Verbose:Lcom/microsoft/applications/events/TraceLevel;

.field public static final enum Warning:Lcom/microsoft/applications/events/TraceLevel;


# instance fields
.field private final m_value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/microsoft/applications/events/TraceLevel;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/microsoft/applications/events/TraceLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/microsoft/applications/events/TraceLevel;->None:Lcom/microsoft/applications/events/TraceLevel;

    new-instance v1, Lcom/microsoft/applications/events/TraceLevel;

    const-string v2, "Error"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lcom/microsoft/applications/events/TraceLevel;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/microsoft/applications/events/TraceLevel;->Error:Lcom/microsoft/applications/events/TraceLevel;

    new-instance v2, Lcom/microsoft/applications/events/TraceLevel;

    const-string v3, "Warning"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lcom/microsoft/applications/events/TraceLevel;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/microsoft/applications/events/TraceLevel;->Warning:Lcom/microsoft/applications/events/TraceLevel;

    new-instance v3, Lcom/microsoft/applications/events/TraceLevel;

    const-string v4, "Information"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lcom/microsoft/applications/events/TraceLevel;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/microsoft/applications/events/TraceLevel;->Information:Lcom/microsoft/applications/events/TraceLevel;

    new-instance v4, Lcom/microsoft/applications/events/TraceLevel;

    const-string v5, "Verbose"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lcom/microsoft/applications/events/TraceLevel;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/microsoft/applications/events/TraceLevel;->Verbose:Lcom/microsoft/applications/events/TraceLevel;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/microsoft/applications/events/TraceLevel;

    move-result-object v0

    sput-object v0, Lcom/microsoft/applications/events/TraceLevel;->$VALUES:[Lcom/microsoft/applications/events/TraceLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/microsoft/applications/events/TraceLevel;->m_value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/microsoft/applications/events/TraceLevel;
    .locals 1

    const-class v0, Lcom/microsoft/applications/events/TraceLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/microsoft/applications/events/TraceLevel;

    return-object p0
.end method

.method public static values()[Lcom/microsoft/applications/events/TraceLevel;
    .locals 1

    sget-object v0, Lcom/microsoft/applications/events/TraceLevel;->$VALUES:[Lcom/microsoft/applications/events/TraceLevel;

    invoke-virtual {v0}, [Lcom/microsoft/applications/events/TraceLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/microsoft/applications/events/TraceLevel;

    return-object v0
.end method


# virtual methods
.method getValue()I
    .locals 1

    iget v0, p0, Lcom/microsoft/applications/events/TraceLevel;->m_value:I

    return v0
.end method
