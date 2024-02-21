# midtrans_flutter_sdk

An Practice Plugin For Bridging Native SDK Into Flutter Plugin Library

Flutter Plugin For Midtrans Android And IOS
Android MIDTRANS SDK Version (2.0.0)
IOS MIDTRANS SDK VERSION (1.24.1)


## Supported Platforms

- [x] Android
- [x] iOS
- [ ] Web

## Usage

To use this plugin, add `midtrans_flutter_sdk` as a dependency in your [pubspec.yaml](https://flutter.dev/docs/development/packages-and-plugins/using-packages) file.

## Getting started

See the [example](example) directory for a sample about start payment by using snap token which using `midtrans_flutter_sdk`.

### MidtransConfig And Initialize

To start using Midtrans you first need to create an instance of `MidtransFlutterSdk` before using any other of our sdk functionalities.  
`MidtransFlutterSdk` receives a `MidtransConfig` object. This is how you can configure our `MidtransFlutterSdk` instance and connect it to your Midtrans account.

*Example:*
```dart
import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk.dart';

  await MidtransFlutterSdk.initialize(
      MidtransConfig(
          clientKey: "clientKey",
          merchantBaseUrl: "merchantBaseUrl",
          //Optional
          enableLog: true, // Default : True
          //Optional
          colorTheme: ColorTheme(
            colorPrimary: Colors.amber,
          ),
          //Optional
          language: "en" //Default : "id"
          ),
    );
```

### Start payment by using snap token
  
We provide SDK method to allow you to make payment by using snap token without initialize transaction request first. You just need to pass snap token as argument of `startPaymentUiFlow` method

*Example:*
```dart
import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk.dart';

   void startMidtransPaymentUIFLow() async {
    await MidtransFlutterSdk.startPaymentUiFlow(
      token: "Midtrans Transaction Token",
    );
  }
```