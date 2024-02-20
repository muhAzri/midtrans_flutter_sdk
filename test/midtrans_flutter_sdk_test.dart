// import 'package:flutter_test/flutter_test.dart';
// import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk.dart';
// import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk_platform_interface.dart';
// import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockMidtransFlutterSdkPlatform
//     with MockPlatformInterfaceMixin
//     implements MidtransFlutterSdkPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final MidtransFlutterSdkPlatform initialPlatform = MidtransFlutterSdkPlatform.instance;

//   test('$MethodChannelMidtransFlutterSdk is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelMidtransFlutterSdk>());
//   });

//   test('getPlatformVersion', () async {
//     MidtransFlutterSdk midtransFlutterSdkPlugin = MidtransFlutterSdk();
//     MockMidtransFlutterSdkPlatform fakePlatform = MockMidtransFlutterSdkPlatform();
//     MidtransFlutterSdkPlatform.instance = fakePlatform;

//     expect(await midtransFlutterSdkPlugin.getPlatformVersion(), '42');
//   });
// }
