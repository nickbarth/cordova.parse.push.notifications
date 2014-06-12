#import "AppDelegate.h"

@interface AppDelegate (notification)
  - (bool)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions;
  - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
  - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
  - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
  - (void)applicationDidBecomeActive:(UIApplication *)application;
@end
