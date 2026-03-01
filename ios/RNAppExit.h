#import <Foundation/Foundation.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import <RNAppExitSpec/RNAppExitSpec.h>
@interface RNAppExit : NSObject <NativeRNAppExitSpec>
#else
#import <React/RCTBridgeModule.h>
@interface RNAppExit : NSObject <RCTBridgeModule>
#endif

@end
