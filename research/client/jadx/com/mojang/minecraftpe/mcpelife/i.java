package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes6.dex */
public final /* synthetic */ class i implements Runnable {
    public final Context a;
    public final Throwable b;

    static {
        MCPELIFE0.registerNativesForClass(9, i.class);
        Hidden0.special_clinit_9_20(i.class);
    }

    public /* synthetic */ i(Context context, Throwable th) {
        this.a = context;
        this.b = th;
    }

    @Override // java.lang.Runnable
    public final native void run();
}
