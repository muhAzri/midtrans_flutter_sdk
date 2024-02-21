import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_config_model.dart';
import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_ui_config_model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'midtrans_flutter_sdk_method_channel.dart';

abstract class MidtransFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a MidtransFlutterSdkPlatform.
  MidtransFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static MidtransFlutterSdkPlatform _instance =
      MethodChannelMidtransFlutterSdk();

  /// The default instance of [MidtransFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelMidtransFlutterSdk].
  static MidtransFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MidtransFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(MidtransFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(MidtransConfig config) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> startPaymentUiFlow({String? token}) async {
    throw UnimplementedError('startPaymentUiFlow() has not been implemented.');
  }

  Future<void> setUIKitCustomSetting(MidtransUiConfigModel config) async {
    throw UnimplementedError(
        'setUIKitCustomSetting() has not been implemented.');
  }
}
