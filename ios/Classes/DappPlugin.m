#import "DappPlugin.h"
#if __has_include(<dapp/dapp-Swift.h>)
#import <dapp/dapp-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dapp-Swift.h"
#endif

@implementation DappPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDappPlugin registerWithRegistrar:registrar];
}
@end
