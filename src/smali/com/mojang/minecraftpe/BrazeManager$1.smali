.class Lcom/mojang/minecraftpe/BrazeManager$1;
.super Ljava/lang/Object;
.source "BrazeManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mojang/minecraftpe/BrazeManager;->requestPushPermission()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mojang/minecraftpe/BrazeManager;


# direct methods
.method constructor <init>(Lcom/mojang/minecraftpe/BrazeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/mojang/minecraftpe/BrazeManager$1;->this$0:Lcom/mojang/minecraftpe/BrazeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v0, 0x0

    sget-object v0, Lcom/google/firebase/heartbeatinfo/vA/bJSuoWIsLMVUq;->PORdCybVd:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mojang/minecraftpe/BrazeManager$1;->this$0:Lcom/mojang/minecraftpe/BrazeManager;

    invoke-static {v1}, Lcom/mojang/minecraftpe/BrazeManager;->access$000(Lcom/mojang/minecraftpe/BrazeManager;)Lcom/mojang/minecraftpe/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mojang/minecraftpe/MainActivity;->suspendGameplayUpdates()V

    iget-object v1, p0, Lcom/mojang/minecraftpe/BrazeManager$1;->this$0:Lcom/mojang/minecraftpe/BrazeManager;

    invoke-static {v1}, Lcom/mojang/minecraftpe/BrazeManager;->access$000(Lcom/mojang/minecraftpe/BrazeManager;)Lcom/mojang/minecraftpe/MainActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mojang/minecraftpe/BrazeManager$1;->this$0:Lcom/mojang/minecraftpe/BrazeManager;

    invoke-static {v2}, Lcom/mojang/minecraftpe/BrazeManager;->access$000(Lcom/mojang/minecraftpe/BrazeManager;)Lcom/mojang/minecraftpe/MainActivity;

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Lcom/mojang/minecraftpe/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method
