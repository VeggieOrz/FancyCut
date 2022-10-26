//
//  FCScreenMacro.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#ifndef FCScreenMacro_h
#define FCScreenMacro_h

/// 刘海屏判断
#define iPhoneX (ABS(MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) / MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) - 896 / 414.0) < 0.01 || ABS(MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) / MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) - 812 / 375.0) < 0.01)

/// 屏幕宽度
#define FCScreenWidth ([UIScreen mainScreen].bounds.size.width)
/// 屏幕高度
#define FCScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define FCStatusBarHeight (iPhoneX ? 44.0f : 20.0f)

/// 判断是否为 iPad 设备
#define FCisPadDevice ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

/// 判断是否处于竖屏状态
#define FCIsPortrait                                                                               \
([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ||       \
 [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

/// iPad上所有的size乘以1.5
#define FCiPadScale (1.5)
/// iPhone上，375以下的屏幕乘以0.85f， 375及以上的屏幕正常显示，乘以1.0f
#define FCiPhoneScale ((FCIsPortrait ? (FCScreenWidth < 375.f) : (FCScreenWidth < 667.f)) ? 0.85f : 1.0f)

/// 统一适配：iPad上的size都会乘以1.5，iPhone上，375以下的屏幕乘以0.85f， 375及以上的屏幕正常显示，乘以1.0f
NS_INLINE CGFloat FCScaleSize(CGFloat size) {
    const CGFloat scale = FCisPadDevice ? FCiPadScale : FCiPhoneScale;
    return scale * size;
}

/// 构造point，返回适配后的point
NS_INLINE CGPoint FCPointMake(CGFloat x, CGFloat y) {
    return CGPointMake(FCScaleSize(x),
                       FCScaleSize(y));
}

/// 已有point适配，返回适配的point
NS_INLINE CGPoint FCPointAdaptive(const CGPoint point) {
    return CGPointMake(FCScaleSize(point.x),
                       FCScaleSize(point.y));
}

/// 构造size, 返回适配后的size
NS_INLINE CGSize FCSizeMake(CGFloat width, CGFloat height) {
    return CGSizeMake(FCScaleSize(width),
                      FCScaleSize(height));
}

/// 已有size适配，返回适配后的size
NS_INLINE CGSize FCSizeAdaptive(const CGSize size) {
    return CGSizeMake(FCScaleSize(size.width),
                      FCScaleSize(size.height));
}

/// 构造rect，返回适配后的rect
NS_INLINE CGRect FCRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(FCScaleSize(x),
                      FCScaleSize(y),
                      FCScaleSize(width),
                      FCScaleSize(height));
}

/// 已有rect适配，返回适配后的rect
NS_INLINE CGRect FCRectAdaptive(const CGRect rect) {
    return CGRectMake(FCScaleSize(rect.origin.x),
                      FCScaleSize(rect.origin.y),
                      FCScaleSize(rect.size.width),
                      FCScaleSize(rect.size.height));
}

/// 构造edgeInsets, 返回适配后的edgeInsets
NS_INLINE UIEdgeInsets FCEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    return UIEdgeInsetsMake(FCScaleSize(top),
                            FCScaleSize(left),
                            FCScaleSize(bottom),
                            FCScaleSize(right));
}

/// 已有edgeInsets适配，返回适配后的edgeInsets
NS_INLINE UIEdgeInsets FCEdgeInsetsAdaptive(const UIEdgeInsets insets) {
    return UIEdgeInsetsMake(FCScaleSize(insets.top),
                            FCScaleSize(insets.left),
                            FCScaleSize(insets.bottom),
                            FCScaleSize(insets.right));
}

#endif /* FCScreenMacro_h */
