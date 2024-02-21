import 'package:flutter/material.dart';

import 'package:midtrans_flutter_sdk/midtrans_flutter_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Initialize Midtrans Flutter SDK
  void initializeMidtrans() async {
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
  }

  //Ui Settings (Currently Only Available for Android)
  void setCustomUiKit() async {
    await MidtransFlutterSdk.setUIKitCustomSetting(
      MidtransUiConfigModel(
        showPaymentStatus: true,
        saveCardChecked: true,
      ),
    );
  }

  void startMidtransPaymentUIFLow() async {
    await MidtransFlutterSdk.startPaymentUiFlow(
      token: "Midtrans Transaction Token",
    );
  }

  @override
  void initState() {
    super.initState();
    initializeMidtrans();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: setCustomUiKit,
                  child: const Text("Set Ui Settings Midtrans"),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: startMidtransPaymentUIFLow,
                  child: const Text("Start Payment Ui Flow"),
                ),
              ],
            ),
          )),
    );
  }
}
