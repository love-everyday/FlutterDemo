#import "ShareActivePlugin.h"



@implementation ShareActivePlugin {
    FlutterResult _result;
    NSDictionary *_arguments;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"share_active"
            binaryMessenger:[registrar messenger]];
  ShareActivePlugin* instance = [[ShareActivePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if (_result) {
      _result([FlutterError errorWithCode:@"multiple_request"
                                  message:@"Cancelled by a second request"
                                  details:nil]);
      _result = nil;
  }
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
      result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"shareActive" isEqualToString:call.method]) {
      _result = result;
      _arguments = call.arguments;
      NSObject * text = [_arguments objectForKey:@"text"];
      NSObject * shareUrl = [_arguments objectForKey:@"url"];
      NSObject * filePath = [_arguments objectForKey:@"filePath"];
      NSMutableArray * params = [[NSMutableArray alloc] init];
      if (text && ![text isKindOfClass:[NSNull class]]) {
          [params addObject:text];
      }
      if (shareUrl && ![shareUrl isKindOfClass:[NSNull class]]) {
          [params addObject:shareUrl];
      }
      if (filePath && ![filePath isKindOfClass:[NSNull class]]) {
          [params addObject:filePath];
      }
      if (params.count > 0) {
          UIActivityViewController * activityVC = [[UIActivityViewController alloc] initWithActivityItems:params applicationActivities:NULL];
          activityVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
          UIViewController *viewController =
          [UIApplication sharedApplication].delegate.window.rootViewController;
          [viewController presentViewController:activityVC animated:true completion:NULL];
      }
      
  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
