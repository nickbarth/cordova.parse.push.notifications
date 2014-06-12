#import "AppDelegate.h"

@interface AppDelegate (ParsePush)
  - (BOOL)application:(UIApplication *)application customDidFinishLaunchingWithOptions:(NSDictionary*)launchOptions;
  - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
  - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
  - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
  - (void)applicationDidBecomeActive:(UIApplication *)application;
@end
