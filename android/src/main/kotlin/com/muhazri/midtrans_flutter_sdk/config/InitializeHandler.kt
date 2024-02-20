package com.muhazri.midtrans_flutter_sdk.config

import android.app.Activity
import androidx.appcompat.app.AppCompatDelegate
import androidx.core.os.LocaleListCompat
import com.midtrans.sdk.uikit.external.UiKitApi
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class InitializeHandler(call: MethodCall,  activity: Activity, channel: MethodChannel) {

    private var call: MethodCall
    private var activity: Activity
    private var channel: MethodChannel

    init {
        this.call = call
        this.activity = activity
        this.channel = channel
        initializeConfig()
    }

     private fun initializeConfig() {
         val clientKey: String? = this.call.argument("clientKey")
         val merchantBaseUrl: String? = this.call.argument("merchantBaseUrl")
         val language: String? = this.call.argument("language")
         val enableLog: Boolean? = this.call.argument("enableLog")
         val colorTheme: Map<String, Long>? = this.call.argument("colorTheme")
         val saveCardChecked: Boolean? = call.argument("saveCardChecked")
         val showPaymentStatus: Boolean? = call.argument("showPaymentStatus")

         val setting = UiKitApi.getDefaultInstance().uiKitSetting

         if (showPaymentStatus != null) {
             setting.showPaymentStatus = showPaymentStatus
         }
         if (saveCardChecked != null) {
             setting.saveCardChecked = saveCardChecked
         }

         val builder = UiKitApi.Builder()
             .withContext(this.activity)
         if (clientKey != null){
             builder.withMerchantClientKey(clientKey)
         }
         if (merchantBaseUrl != null) {
             builder.withMerchantUrl(merchantBaseUrl)
         }
         if(language != null){
             setLocaleNew(language)
         }
         builder.enableLog(enableLog ?: true)

         colorTheme?.let {
            val colorPrimary: Long? = it["colorPrimary"]
            val colorPrimaryDark: Long? = it["colorPrimaryDark"]
            val colorSecondary: Long? = it["colorSecondary"]
             builder.withColorTheme(com.midtrans.sdk.uikit.api.model.CustomColorTheme(
                 colorPrimary?.toString(16) ?: "0",
                 colorPrimaryDark?.toString(16) ?: "0",
                 colorSecondary?.toString(16) ?: "0"
             ))
        }



        builder.build()
    }

    private fun setLocaleNew(languageCode: String?) {
        val locales = LocaleListCompat.forLanguageTags(languageCode)
        AppCompatDelegate.setApplicationLocales(locales)
    }
}

