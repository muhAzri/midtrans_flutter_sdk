import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_config_model.dart';

import 'midtrans_flutter_sdk_platform_interface.dart';

/// An implementation of [MidtransFlutterSdkPlatform] that uses method channels.
class MethodChannelMidtransFlutterSdk extends MidtransFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('midtrans_flutter_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> initialize(MidtransConfig config) async {
    await methodChannel.invokeMethod('initialize', config.toJson());
  }

  @override
  Future<void> startPaymentUiFlow({String? token}) async {
    if(token == null){
       throw Exception("Token Is Null");
    }

     return methodChannel.invokeMethod('startPaymentUiFlow', {
      "token": token,
    });
  }
}
