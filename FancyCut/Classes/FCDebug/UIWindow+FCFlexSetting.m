//
//  UIWindow+FCFlexSetting.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "UIWindow+FCFlexSetting.h"
#if DEBUG
#import <FLEX/FLEXManager.h>
#endif

@implementation UIWindow (FCFlexSetting)

#if DEBUG
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [super motionBegan:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
    }
}
#endif

@end
