package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.text.Spanned;
import android.view.View;
import android.widget.LinearLayout;
import org.json.JSONObject;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes3.dex */
public abstract class l {
    public static Handler a;
    public static boolean b;
    public static Object c;

    static {
        MCPELIFE0.registerNativesForClass(14, l.class);
        Hidden0.special_clinit_14_00(l.class);
    }

    public static native /* synthetic */ void a(Context context, String str, View view);

    public static native /* synthetic */ void b(AlertDialog alertDialog, View view);

    public static native /* synthetic */ void c(String str, Context context);

    public static native int d(Resources resources, int i);

    public static native String e(String str);

    public static native View f(Object obj);

    public static native Spanned g(String str);

    public static native LinearLayout.LayoutParams h(int i);

    public static native LinearLayout.LayoutParams i(int i, float f);

    public static native void j(Object obj);

    public static native void k(Object obj, int i);

    public static native /* synthetic */ void l(String str, Context context);

    public static native /* synthetic */ void m(AlertDialog alertDialog, View view);

    public static native /* synthetic */ void n(Context context, String str, View view);

    public static native void o(Context context, JSONObject jSONObject);

    public static native void p(Context context, Throwable th);
}
