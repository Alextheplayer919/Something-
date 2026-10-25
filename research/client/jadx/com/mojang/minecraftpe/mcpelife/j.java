package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;
import org.json.JSONObject;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes3.dex */
public final /* synthetic */ class j implements Runnable {
    public final Context a;
    public final JSONObject b;

    static {
        MCPELIFE0.registerNativesForClass(10, j.class);
        Hidden0.special_clinit_10_20(j.class);
    }

    public /* synthetic */ j(Context context, JSONObject jSONObject) {
        this.a = context;
        this.b = jSONObject;
    }

    @Override // java.lang.Runnable
    public final native void run();
}
