#import <Foundation/Foundation.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import <RNCloseAppSpec/RNCloseAppSpec.h>
@interface RNCloseApp : NSObject <NativeRNCloseAppSpec>
#else
#import <React/RCTBridgeModule.h>
@interface RNCloseApp : NSObject <RCTBridgeModule>
#endif

@end
