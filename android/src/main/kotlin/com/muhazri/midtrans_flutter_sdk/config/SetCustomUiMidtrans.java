package com.muhazri.midtrans_flutter_sdk.config;

import com.midtrans.sdk.corekit.core.MidtransSDK;
import com.midtrans.sdk.corekit.core.UIKitCustomSetting;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;


public class SetCustomUiMidtrans {

    private final MethodCall call;
    private final Result result;

    public SetCustomUiMidtrans(MethodCall call, Result result) {
        this.call = call;
        this.result = result;
        setUIKitCustomSetting();
    }

    private void setUIKitCustomSetting() {
        Boolean showPaymentStatus = this.call.argument("showPaymentStatus");
        Boolean saveCardChecked = this.call.argument("saveCardChecked");

        UIKitCustomSetting setting = new UIKitCustomSetting();
        if (showPaymentStatus != null) {
            setting.setShowPaymentStatus(showPaymentStatus);
        }
        if (saveCardChecked != null) {
            setting.setShowPaymentStatus(saveCardChecked);
        }

        MidtransSDK.getInstance().setUiKitCustomSetting(setting);
        this.result.success(null);
    }

}
