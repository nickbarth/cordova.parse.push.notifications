# Cordova Parse Push Notifications

Cordova / Phonegap plugin for native integration of Apple Push Notifications for iOS with Parse.

## Adding the Plugin

```
cordova plugin add https://github.com/nickbarth/cordova.parse.push.notifications

# Uncomment and fill in with your Parse credentials in:
# plugins/cordova.parse.push.notifications/src/ios/AppDelegate+ParsePush.m

[Parse setApplicationId:@"your_application_id" clientKey:@"your_client_key"];
```

### License
MIT &copy; 2014 Nick Barth
