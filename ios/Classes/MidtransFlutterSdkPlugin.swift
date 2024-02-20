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
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "initialize":
        initWithCall(call, result: result)
    case "startPaymentUiFlow":
        startPaymentUiFlowWithCall(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

    func rootViewController() -> UIViewController? {
            return UIApplication.shared.keyWindow?.rootViewController
        }
    
    
    func initWithCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let arguments = call.arguments as? [String: Any],
              let clientKey = arguments["clientKey"] as? String,
              let merchantServerURL = arguments["merchantBaseUrl"] as? String else {
            let error = FlutterError(code: "missing_arguments",
                                     message: "Missing required arguments",
                                     details: nil)
            result(error)
            return
        }
        
        var environment: MidtransServerEnvironment = .production
        #if DEBUG
        environment = .sandbox
        #endif
        
        MidtransConfig.shared().setClientKey(clientKey, environment: environment, merchantServerURL: merchantServerURL)
        result(nil)
    }
    
    func startPaymentUiFlowWithCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
           guard let token = call.arguments as? String else {
               result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing token", details: nil))
               return
           }
           
        MidtransMerchantClient.shared().requestTransacation(withCurrentToken: token) { regenerateToken, error in
               guard let regenerateToken = regenerateToken else {
                   result(FlutterError(code: "REQUEST_TOKEN_FAILED", message: "Failed to request transaction token", details: nil))
                   return
               }
               
               let vc = MidtransUIPaymentViewController(token: regenerateToken)
                         if let paymentDelegate = self as? MidtransUIPaymentViewControllerDelegate {
                             vc?.paymentDelegate = paymentDelegate
                         }
                         if let rootViewController = self.rootViewController() {
                             rootViewController.present(vc!, animated: true, completion: nil)
                         }
           }
           result(nil)
       }

}
