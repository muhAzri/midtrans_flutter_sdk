package com.muhazri.midtrans_flutter_sdk.config;

import android.app.Activity;


import com.midtrans.sdk.corekit.core.themes.CustomColorTheme;
import com.midtrans.sdk.corekit.models.TransactionResponse;
import com.midtrans.sdk.uikit.SdkUIFlowBuilder;

import java.util.HashMap;
import java.util.Map;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class InitializeMidtrans {
    private final MethodCall call;
    private final Activity activity;
    private final MethodChannel channel;

    public InitializeMidtrans(MethodCall call, Activity activity, MethodChannel channel) {
        this.call = call;
        this.activity = activity;
        this.channel = channel;
        init();
    }

    private void init() {
        String clientKey = this.call.argument("clientKey");
        String merchantBaseUrl = this.call.argument("merchantBaseUrl");
        String language = this.call.argument("language");
        Boolean enableLog = this.call.argument("enableLog");
        Map<String, Long> colorTheme = this.call.argument("colorTheme");
        SdkUIFlowBuilder builder = SdkUIFlowBuilder.init()
                .setContext(this.activity)
                .setClientKey(clientKey)
                .setMerchantBaseUrl(merchantBaseUrl)
                .setLanguage(language)
                .enableLog(enableLog != null ? enableLog : true)
                .setTransactionFinishedCallback(transactionResult -> {
                    HashMap<String, Object> arguments = new HashMap<>();
                    arguments.put("isTransactionCanceled", transactionResult.isTransactionCanceled());
                    TransactionResponse response = transactionResult.getResponse();
                    if (response != null) {
                        arguments.put("transactionStatus", response.getTransactionStatus());
                        arguments.put("statusMessage", response.getStatusMessage());
                        arguments.put("transactionId", response.getTransactionId());
                        arguments.put("paymentType", response.getPaymentType());
                    }
                    channel.invokeMethod("onTransactionFinished", arguments);
                });
        if (colorTheme != null) {
            Long colorPrimary = colorTheme.get("colorPrimary");
            Long colorPrimaryDark = colorTheme.get("colorPrimaryDark");
            Long colorSecondary = colorTheme.get("colorSecondary");
            builder.setColorTheme(
                    new CustomColorTheme(
                            Long.toString(colorPrimary != null ? colorPrimary : 0, 16),
                            Long.toString(colorPrimaryDark != null ? colorPrimaryDark : 0, 16),
                            Long.toString(colorSecondary != null ? colorSecondary : 0, 16)
                    )
            );
        }
        builder.buildSDK();
    }
}
