package com.pairip;

import MCPELIFE0.MCPELIFE0;
import MCPELIFE0.hidden.Hidden0;
import android.content.Context;

/* JADX INFO: compiled from: Dex2C */
/* JADX INFO: loaded from: /home/runner/work/Something-/Something-/research/client/dex/classes4.dex */
public class SignatureCheck {
    private static final String ALLOWLISTED_SIG = "Vn3kj4pUblROi2S+QfRRL9nhsaO2uoHQg6+dpEtxdTE=";
    private static final String TAG = "SignatureCheck";
    private static String expectedLegacyUpgradedSignature = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w=";
    private static String expectedSignature = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w=";
    private static String expectedTestSignature = "Mb5ACW+THNfxHV4mLSssQ3xEOF+07LwQE9ladDWBb5w=";

    static {
        MCPELIFE0.registerNativesForClass(26, SignatureCheck.class);
        Hidden0.special_clinit_26_30(SignatureCheck.class);
    }

    private SignatureCheck() {
    }

    public static native void verifyIntegrity(Context context);

    public static native boolean verifySignatureMatches(String str);
}
