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

/// 判断是否为 iPad 设备
#define FCisPadDevice ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

/// 判断是否处于竖屏状态
#define FCIsPortrait                                                                               \
([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ||       \
 [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

#endif /* FCScreenMacro_h */
