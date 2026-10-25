package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes2.dex */
public final /* synthetic */ class k implements Runnable {
    public final Context a;
    public final Exception b;

    static {
        MCPELIFE0.registerNativesForClass(11, k.class);
        Hidden0.special_clinit_11_20(k.class);
    }

    public /* synthetic */ k(Context context, Exception exc) {
        this.a = context;
        this.b = exc;
    }

    @Override // java.lang.Runnable
    public final native void run();
}
