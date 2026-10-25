package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes6.dex */
public class l$b extends ViewOutlineProvider {
    static {
        MCPELIFE0.registerNativesForClass(13, l$b.class);
        Hidden0.special_clinit_13_20(l$b.class);
    }

    @Override // android.view.ViewOutlineProvider
    public native void getOutline(View view, Outline outline);
}
