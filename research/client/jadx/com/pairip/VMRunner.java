package com.pairip;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipFile;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes4.dex */
public class VMRunner {
    private static final int PACKAGE_MANAGER_TRIES = 5;
    private static final String TAG = "VMRunner";
    private static String apkPath = null;
    private static Context context = null;
    private static String loggingEnabled = "false";
    private static int versionCode = 972111401;

    static {
        MCPELIFE0.registerNativesForClass(27, VMRunner.class);
        Hidden0.special_clinit_27_00(VMRunner.class);
    }

    private VMRunner() {
    }

    public static native Runnable createInvokeRunnable(String str, Object[] objArr);

    public static native Object executeVM(byte[] bArr, Object[] objArr);

    private static native ZipFile getApkFromContextPath();

    private static native String getApkPathFromResource();

    public static native Context getContext();

    private static native byte[] getVmByteCode(String str) throws IOException;

    public static native Object invoke(String str, Object[] objArr);

    private static native boolean isDebuggingEnabled();

    private static native ZipFile openBaseApk();

    private static native byte[] readByteCode(String str) throws IOException;

    private static native byte[] readFullByteArrayFromStream(InputStream inputStream, byte[] bArr) throws IOException;

    public static native void setContext(Context context2);

    private static native ZipFile tryOpen(String str);
}
