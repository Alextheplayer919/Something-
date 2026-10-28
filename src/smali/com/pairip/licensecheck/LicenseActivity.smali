.class public Lcom/pairip/licensecheck/LicenseActivity;
.super Landroid/app/Activity;
.source "Dex2C"


# static fields
.field public static final ACTIVITY_TYPE_ARG_NAME:Ljava/lang/String; = "activitytype"

.field public static final PAYWALL_INTENT_ARG_NAME:Ljava/lang/String; = "paywallintent"

.field private static final TAG:Ljava/lang/String; = "LicenseActivity"


# direct methods
.method public static native synthetic $r8$lambda$N5_Pzpb-eSKmOONXn3Kn0QvMbys(Lcom/pairip/licensecheck/LicenseActivity;)V
.end method

.method public static native synthetic $r8$lambda$fE_XZ7S0hhHsxQNTfy8mxeJ7kEU(Lcom/pairip/licensecheck/LicenseActivity;Landroid/content/DialogInterface;I)V
.end method

.method public static native synthetic $r8$lambda$x-JmBIDmuVzGN23Wk7Dd1TBpzO0(Lcom/pairip/licensecheck/LicenseActivity;Landroid/app/PendingIntent;)V
.end method

.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x1c

    const-class v1, Lcom/pairip/licensecheck/LicenseActivity;

    invoke-static {v0, v1}, LMCPELIFE0/MCPELIFE0;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, LMCPELIFE0/hidden/Hidden0;->special_clinit_28_130(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private native synthetic lambda$showErrorDialog$0()V
.end method

.method private native synthetic lambda$showErrorDialog$1(Landroid/content/DialogInterface;I)V
.end method

.method private native synthetic lambda$showPaywallAndCloseApp$0(Landroid/app/PendingIntent;)V
.end method

.method private native logAndShowErrorDialog(Ljava/lang/String;)V
.end method

.method private native logAndShowErrorDialog(Ljava/lang/String;Ljava/lang/Exception;)V
.end method

.method private native showErrorDialog()V
.end method

.method private native showPaywallAndCloseApp()V
.end method


# virtual methods
.method protected native closeApp()V
.end method

.method public native onStart()V
.end method
