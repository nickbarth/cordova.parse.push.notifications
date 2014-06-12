#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDV.h>

@interface ParsePush : CDVPlugin{
  NSString* callbackId;
}

@property (nonatomic, retain) NSString* callbackId;
- (void)sendNotification:(CDVInvokedUrlCommand *)command;
- (void)getNotification:(CDVInvokedUrlCommand *)command;
@end
