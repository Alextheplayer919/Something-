package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes2.dex */
public final /* synthetic */ class f implements Runnable {
    public final String a;
    public final Context b;

    static {
        MCPELIFE0.registerNativesForClass(6, f.class);
        Hidden0.special_clinit_6_20(f.class);
    }

    public /* synthetic */ f(String str, Context context) {
        this.a = str;
        this.b = context;
    }

    @Override // java.lang.Runnable
    public final native void run();
}
