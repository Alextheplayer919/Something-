.class public Lcom/microsoft/applications/events/PageActionData;
.super Ljava/lang/Object;
.source "PageActionData.java"


# instance fields
.field public actionType:Lcom/microsoft/applications/events/ActionType;

.field public destinationUri:Ljava/lang/String;

.field public inputDeviceType:Lcom/microsoft/applications/events/InputDeviceType;

.field public pageViewId:Ljava/lang/String;

.field public rawActionType:Lcom/microsoft/applications/events/RawActionType;

.field public targetItemDataSourceCategory:Ljava/lang/String;

.field public targetItemDataSourceCollection:Ljava/lang/String;

.field public targetItemDataSourceName:Ljava/lang/String;

.field public targetItemId:Ljava/lang/String;

.field public targetItemLayoutContainer:Ljava/lang/String;

.field public targetItemLayoutRank:S


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/microsoft/applications/events/ActionType;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemId:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceName:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceCategory:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemDataSourceCollection:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemLayoutContainer:Ljava/lang/String;

    iput-object v0, p0, Lcom/microsoft/applications/events/PageActionData;->destinationUri:Ljava/lang/String;

    iput-object p1, p0, Lcom/microsoft/applications/events/PageActionData;->pageViewId:Ljava/lang/String;

    iput-object p2, p0, Lcom/microsoft/applications/events/PageActionData;->actionType:Lcom/microsoft/applications/events/ActionType;

    sget-object p1, Lcom/microsoft/applications/events/RawActionType;->Unspecified:Lcom/microsoft/applications/events/RawActionType;

    iput-object p1, p0, Lcom/microsoft/applications/events/PageActionData;->rawActionType:Lcom/microsoft/applications/events/RawActionType;

    sget-object p1, Lcom/microsoft/applications/events/InputDeviceType;->Unspecified:Lcom/microsoft/applications/events/InputDeviceType;

    iput-object p1, p0, Lcom/microsoft/applications/events/PageActionData;->inputDeviceType:Lcom/microsoft/applications/events/InputDeviceType;

    const/4 p1, 0x0

    iput-short p1, p0, Lcom/microsoft/applications/events/PageActionData;->targetItemLayoutRank:S

    return-void
.end method
