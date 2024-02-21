import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_config_model.dart';
import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_ui_config_model.dart';

import 'midtrans_flutter_sdk_platform_interface.dart';
export "model/index.dart";

/// A class that provides methods for interacting with the Midtrans Flutter SDK.
///
/// This class serves as a bridge between the Flutter application and the native
/// platform-specific implementations provided by `midtrans_flutter_sdk_platform_interface`.
/// Created By Muhammad Azri
class MidtransFlutterSdk {
  /// Initializes the Midtrans Flutter SDK with the provided configuration.
  ///
  /// This method must be called before any other SDK operations.
  ///
  /// [config] The configuration for initializing the SDK.
  ///
  /// Throws a [PlatformException] if initialization fails.
  static Future<void> initialize(MidtransConfig config) {
    return MidtransFlutterSdkPlatform.instance.initialize(config);
  }

  /// Starts the payment UI flow.
  ///
  /// This method launches the native payment UI flow using the provided token.
  ///
  /// [token] The payment token to start the payment process.
  ///
  /// Thorws a [Excecption] if token is null or empty
  /// Throws a [PlatformException] if starting the payment UI flow fails.
  static Future<void> startPaymentUiFlow({String? token}) {
    return MidtransFlutterSdkPlatform.instance.startPaymentUiFlow(token: token);
  }

  /// Sets the custom UI configuration for the payment UI.
  ///
  /// This method allows customizing the appearance and behavior of the payment UI.
  ///
  /// [config] The custom UI configuration settings.
  ///
  /// Throws a [PlatformException] if setting the UI custom settings fails.
  static Future<void> setUIKitCustomSetting(MidtransUiConfigModel config) {
    return MidtransFlutterSdkPlatform.instance.setUIKitCustomSetting(config);
  }
}
