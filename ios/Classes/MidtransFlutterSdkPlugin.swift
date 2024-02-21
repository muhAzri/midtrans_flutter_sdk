//
//  MidtransFlutterSdkPlugin.swift
//  midtrans_flutter_sdk
//
//  Created by Azri on 20/02/24.
//

import Flutter
import UIKit

public class MidtransFlutterSdkPlugin: NSObject, FlutterPlugin {
    static var channel: FlutterMethodChannel!
    
  public static func register(with registrar: FlutterPluginRegistrar) {
     channel = FlutterMethodChannel(name: "midtrans_flutter_sdk", binaryMessenger: registrar.messenger())
    let instance = MidtransFlutterSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initialize":
        MidtransHandler().initConfig(call, result: result)
    case "startPaymentUiFlow":
        MidtransHandler().startPaymentFlow(call, result: result)
    case "setUiKitCustomSetting":
        MidtransHandler().setUiKitCustom(call,result:result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
