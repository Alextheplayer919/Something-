package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;
import java.io.InputStream;
import org.json.JSONObject;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes6.dex */
public class l$a implements b.a {
    public final Context a;

    static {
        MCPELIFE0.registerNativesForClass(12, l$a.class);
        Hidden0.special_clinit_12_90(l$a.class);
    }

    public l$a(Context context) {
        this.a = context;
    }

    public static native /* synthetic */ void c(Context context, JSONObject jSONObject);

    public static native /* synthetic */ void d(Context context, Exception exc);

    public static native /* synthetic */ void e(Context context, Throwable th);

    public static native /* synthetic */ void f(Context context, Throwable th);

    public static native /* synthetic */ void g(Context context, JSONObject jSONObject);

    public static native /* synthetic */ void h(Context context, Exception exc);

    public native void a(Throwable th);

    public native void b(InputStream inputStream);
}
