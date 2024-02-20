//
//  MidtransHandler.m
//  midtrans_flutter_sdk
//
//  Created by Azri on 20/02/24.
//

#import "MidtransHandler.h"
#import <MidtransKit/MidtransKit.h>


@implementation MidtransHandler
FlutterMethodChannel* channel;

- (UIViewController *)rootViewController {
  return [UIApplication sharedApplication].keyWindow.rootViewController;
}

- (void)initConfig:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* clientKey = call.arguments[@"clientKey"];
    NSString* merchantServerURL = call.arguments[@"merchantBaseUrl"];
       
    MidtransServerEnvironment environment = MidtransServerEnvironmentProduction;
    #ifdef DEBUG
    environment = MidtransServerEnvironmentSandbox;
    #endif
    [CONFIG setClientKey:clientKey
            environment:environment
    merchantServerURL:merchantServerURL];
    result(nil);
}


- (void)startPaymentFlow:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* token = call.arguments[@"token"];
    [[MidtransMerchantClient shared] requestTransacationWithCurrentToken:token completion:^(MidtransTransactionTokenResponse * _Nullable regenerateToken, NSError * _Nullable error) {
        MidtransUIPaymentViewController *vc = [[MidtransUIPaymentViewController alloc] initWithToken:regenerateToken];
        vc.paymentDelegate = self;
        [[self rootViewController] presentViewController:vc animated:YES completion:nil];
    }];
    result(nil);
}

- (void)setUiKitCustom:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    result(nil);
}

- (void)onTransactionFinished:(MidtransTransactionResult *)result canceled:(BOOL) isTransactionCanceled {
    NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
    arguments[@"isTransactionCanceled"] = @(isTransactionCanceled);
    if (result != nil) {
        arguments[@"transactionStatus"] = result.transactionStatus;
        arguments[@"statusMessage"] = result.statusMessage;
        arguments[@"transactionId"] = result.transactionId;
        arguments[@"orderId"] = result.orderId;
        arguments[@"paymentType"] = result.paymentType;
    }
    [channel invokeMethod:@"onTransactionFinished" arguments:arguments];
}


#pragma mark - MidtransUIPaymentViewControllerDelegate
- (void)paymentViewController:(MidtransUIPaymentViewController *)viewController paymentDeny:(MidtransTransactionResult *)result {
    NSLog(@"paymentDeny: %@", result);
    [self onTransactionFinished:result canceled:NO];
}

- (void)paymentViewController:(MidtransUIPaymentViewController *)viewController paymentFailed:(NSError *)error {
    NSLog(@"paymentFailed: %@", error);
    [self onTransactionFinished:nil canceled:NO];
}

- (void)paymentViewController:(MidtransUIPaymentViewController *)viewController paymentPending:(MidtransTransactionResult *)result {
    NSLog(@"paymentPending: %@", result);
    [self onTransactionFinished:result canceled:NO];
}

- (void)paymentViewController:(MidtransUIPaymentViewController *)viewController paymentSuccess:(MidtransTransactionResult *)result {
    NSLog(@"paymentSuccess: %@", result);
    [self onTransactionFinished:result canceled:NO];
}

- (void)paymentViewController_paymentCanceled:(MidtransUIPaymentViewController *)viewController {
    NSLog(@"paymentCanceled");
    [self onTransactionFinished:nil canceled:YES];
}

@end
