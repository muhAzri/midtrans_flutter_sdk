//
//  MidtransHandler.h
//  midtrans_flutter_sdk
//
//  Created by Azri on 20/02/24.
//

#import <Flutter/Flutter.h>
#import <MidtransKit/MidtransKit.h>


#ifndef MidtransHandler_h

@interface MidtransHandler : NSObject<MidtransUIPaymentViewControllerDelegate>
- (void)initConfig:(FlutterMethodCall*)call result:(FlutterResult)result;
- (void)startPaymentFlow:(FlutterMethodCall*)call result:(FlutterResult)result;
- (void)setUiKitCustom:(FlutterMethodCall*)call result:(FlutterResult)result;
@end

#define MidtransHandler_h


#endif /* MidtransHandler_h */
