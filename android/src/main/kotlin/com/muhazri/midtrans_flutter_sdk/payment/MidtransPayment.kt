package com.muhazri.midtrans_flutter_sdk.payment

import android.app.Activity
import com.midtrans.sdk.corekit.core.MidtransSDK
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result

class MidtransPayment {

    companion object {
        @JvmStatic
        fun startPaymentUiFlow(call: MethodCall, activity: Activity, result: Result) {
            val token: String? = call.argument("token")
            token?.let {
                MidtransSDK.getInstance().startPaymentUiFlow(activity, it)
                result.success(null)
            } ?: result.error("TOKEN_ERROR", "Token is null", null)
        }
    }

}