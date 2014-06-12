#import "ParsePush.h"

@implementation ParsePush

@synthesize callbackId;

- (void)sendNotification:(CDVInvokedUrlCommand *)command
{

}

- (void)getNotification:(CDVInvokedUrlCommand *)command
{

}

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
