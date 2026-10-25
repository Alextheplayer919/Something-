package com.mojang.minecraftpe.mcpelife;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import java.net.HttpURLConnection;
import java.net.URL;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes6.dex */
public class b {
    public HttpURLConnection a;
    public final a b;

    static {
        MCPELIFE0.registerNativesForClass(2, b.class);
        Hidden0.special_clinit_2_30(b.class);
    }

    public b(String str, a aVar) {
        this.a = null;
        this.b = aVar;
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            this.a = httpURLConnection;
            httpURLConnection.setRequestMethod(y.decode(new byte[]{82, 48, 86, 85}));
        } catch (Throwable th) {
            aVar.a(th);
        }
    }

    public final native boolean a();

    public native void b();
}
