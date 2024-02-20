
import 'package:midtrans_flutter_sdk/model/midtrans_config/midtrans_config_model.dart';

import 'midtrans_flutter_sdk_platform_interface.dart';

class MidtransFlutterSdk {
  Future<String?> getPlatformVersion() {
    return MidtransFlutterSdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> initialize(MidtransConfig config) {
    return MidtransFlutterSdkPlatform.instance.initialize(config);
  }

  static Future<void> startPaymentUiFlow({String? token}){
    return MidtransFlutterSdkPlatform.instance.startPaymentUiFlow(token: token);
  }

}
