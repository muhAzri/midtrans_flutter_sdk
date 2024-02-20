package com.muhazri.midtrans_flutter_sdk.payment;

import android.app.Activity;

import io.flutter.plugin.common.MethodCall;
import com.midtrans.sdk.corekit.core.MidtransSDK;
import io.flutter.plugin.common.MethodChannel.Result;


public class MidtransStartPaymentFlow {

    private final MethodCall call;
    private final Activity activity;
    private final Result result;

    public MidtransStartPaymentFlow(MethodCall call,Activity activity, Result result) {
        this.call = call;
        this.result = result;
        this.activity = activity;
        startPaymentUiFlow();
    }

    private void startPaymentUiFlow() {
        String token = this.call.argument("token");
        MidtransSDK.getInstance().startPaymentUiFlow(activity, token);
        this.result.success(null);
    }
}
