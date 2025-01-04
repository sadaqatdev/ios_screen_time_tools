#import "IosScreenTimePlugin.h"
#if __has_include(<ios_screen_time_tools/ios_screen_time_tools-Swift.h>)
#import <ios_screen_time_tools/ios_screen_time_tools-Swift.h>
#else
#import "ios_screen_time_tools-Swift.h"
#endif

@implementation IosScreenTimePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIosScreenTimePlugin registerWithRegistrar:registrar];
}
@end