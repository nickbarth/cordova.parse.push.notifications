#import <Parse/Parse.h>
#import "ParsePush.h"
#import "AppDelegate.h"

@implementation ParsePush

@synthesize callbackId;

/***************************** AppDelegate Overrides ***************************/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  /******************************************************************************/
  // Uncomment and fill in with your Parse credentials:
  // [Parse setApplicationId:@"your_application_id" clientKey:@"your_client_key"];
  /******************************************************************************/

  [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

/***************************** Notification Events ***************************/

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  PFInstallation *currentInstallation = [PFInstallation currentInstallation];
  [currentInstallation setDeviceTokenFromData:deviceToken];
  currentInstallation.channels = @[@"global"];
  [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  NSLog(@"User Info: %@",  userInfo);
  NSString *jsCallback = [NSString stringWithFormat:@"%@(%@);", @"window.receiveNotification", [NSString stringWithFormat:@"%@", userInfo]];
  [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
  //[PFPush handlePush:userInfo];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  if (error.code == 3010) {
    NSLog(@"Push notifications are not supported in the iOS Simulator.");
  } else {
    NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
  }
}

/***************************** Send Notifications ********************/

- (void)sendNotification:(CDVInvokedUrlCommand *)command {
  [self performSelectorOnMainThread:@selector(doSuccessCallback:) withObject:[NSString @"Success"] waitUntilDone:NO];
}

- (void)getNotification:(CDVInvokedUrlCommand *)command {
  [self performSelectorOnMainThread:@selector(doFailCallback:) withObject:[NSString @"Error"] waitUntilDone:NO];
}

/***************************** Callbacks ****************************/

-(void) doSuccessCallback:(NSString*)message {
  NSLog(@"Success Callback: %@", message);

  CDVPluginResult* pluginResult = nil;
  NSString* javaScript = nil;
  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
  javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
  [self writeJavascript:javaScript];
}

-(void) doFailCallback:(NSString*)error {
  NSLog(@"Fail Callback: %@",  error);

  CDVPluginResult* pluginResult = nil;
  NSString* javaScript = nil;

  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:error];
  javaScript = [pluginResult toErrorCallbackString:self.callbackId];

  [self writeJavascript:javaScript];
}

@end
