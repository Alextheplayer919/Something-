package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;
import android.view.View;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes2.dex */
public final /* synthetic */ class h implements View.OnClickListener {
    public final Context a;
    public final String b;

    static {
        MCPELIFE0.registerNativesForClass(8, h.class);
        Hidden0.special_clinit_8_20(h.class);
    }

    public /* synthetic */ h(Context context, String str) {
        this.a = context;
        this.b = str;
    }

    @Override // android.view.View.OnClickListener
    public final native void onClick(View view);
}
