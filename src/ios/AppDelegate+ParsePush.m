#import "AppDelegate+ParsePush.h"
#import <Parse/Parse.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDV.h>
#import <objc/runtime.h>

@implementation AppDelegate

+ (void)load {
  Method original = class_getInstanceMethod(self, @selector(didFinishLaunchingWithOptions:));
  Method custom = class_getInstanceMethod(self, @selector(customDidFinishLaunchingWithOptions:));
  method_exchangeImplementations(original, custom);
}

- (BOOL)application:(UIApplication*)application customDidFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  /******************************************************************************/
  // Uncomment and fill in with your Parse credentials:
  // [Parse setApplicationId:@"your_application_id" clientKey:@"your_client_key"];
  /******************************************************************************/
  [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  // Store the deviceToken in the current installation and save it to Parse.
  PFInstallation *currentInstallation = [PFInstallation currentInstallation];
  [currentInstallation setDeviceTokenFromData:deviceToken];
  [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  if (error.code == 3010) {
    NSLog(@"Push notifications are not supported in the iOS Simulator.");
  } else {
    // show some alert or otherwise handle the failure to register.
    NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
  }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  if([application applicationState] == UIApplicationStateInactive) {
    NSLog(@"Received notification while inactive: %@", userInfo);
    [PFPush handlePush:userInfo];
  }
  else
  {
    NSLog(@"Received notifications while active: %@", userInfo);
  }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  NSLog(@"Active - Set Badge Number to Zero");
}

@end
