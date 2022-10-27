//
//  UIColor+FCColor.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FCColor)

/// 通过 rgba 获取UIColor
/// @param rgba rgba 信息，每 8 位表示一个颜色通道
+ (UIColor *)fc_colorWithRGBA:(uint32_t)rgba;

/// 通过 argb 获取UIColor
/// @param argb argb 信息，每 8 位表示一个颜色通道
+ (UIColor *)fc_colorWithARGB:(uint32_t)argb;

/// 通过 rgb 获取UIColor
/// @param rgb rgb 信息，每 8 位表示一个颜色通道
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgb;

/// 通过 rgb 和 alpha 获取UIColor
/// @param rgb rgb 信息，每 8 位表示一个颜色通道
/// @param alpha alpha 透明度信息
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgb alpha:(CGFloat)alpha;

/// 通过WEB颜色串生成一个UIColor
/// @param hexString WEB颜色串，支持形式有："#rrggbbaa"、"#rrggbb"、"#rgb"、"rrggbbaa"、"rrggbb"、"rgb"
+ (UIColor *)fc_colorWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
