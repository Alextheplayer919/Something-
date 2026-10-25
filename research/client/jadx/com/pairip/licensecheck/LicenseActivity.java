package com.pairip.licensecheck;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.DialogInterface;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes.dex */
public class LicenseActivity extends Activity {
    public static final String ACTIVITY_TYPE_ARG_NAME = "activitytype";
    public static final String PAYWALL_INTENT_ARG_NAME = "paywallintent";
    private static final String TAG = "LicenseActivity";

    /* JADX INFO: renamed from: $r8$lambda$N5_Pzpb-eSKmOONXn3Kn0QvMbys, reason: not valid java name */
    public static native /* synthetic */ void m265$r8$lambda$N5_PzpbeSKmOONXn3Kn0QvMbys(LicenseActivity licenseActivity);

    public static native /* synthetic */ void $r8$lambda$fE_XZ7S0hhHsxQNTfy8mxeJ7kEU(LicenseActivity licenseActivity, DialogInterface dialogInterface, int i);

    /* JADX INFO: renamed from: $r8$lambda$x-JmBIDmuVzGN23Wk7Dd1TBpzO0, reason: not valid java name */
    public static native /* synthetic */ void m266$r8$lambda$xJmBIDmuVzGN23Wk7Dd1TBpzO0(LicenseActivity licenseActivity, PendingIntent pendingIntent);

    static {
        MCPELIFE0.registerNativesForClass(28, LicenseActivity.class);
        Hidden0.special_clinit_28_130(LicenseActivity.class);
    }

    private native /* synthetic */ void lambda$showErrorDialog$0();

    private native /* synthetic */ void lambda$showErrorDialog$1(DialogInterface dialogInterface, int i);

    private native /* synthetic */ void lambda$showPaywallAndCloseApp$0(PendingIntent pendingIntent);

    private native void logAndShowErrorDialog(String str);

    private native void logAndShowErrorDialog(String str, Exception exc);

    private native void showErrorDialog();

    private native void showPaywallAndCloseApp();

    protected native void closeApp();

    @Override // android.app.Activity
    public native void onStart();
}
