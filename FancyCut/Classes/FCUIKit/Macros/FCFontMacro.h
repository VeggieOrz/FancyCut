//
//  FCFontMacro.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#ifndef FCFontMacro_h
#define FCFontMacro_h

#import "FCScreenMacro.h"

/// San Francisco - 纯英文文本使用
// 粗体 - 英文
#define FCFont_SEMIBOLD_EN(fontSize) ([UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold])

// 中 - 英文
#define FCFont_MEDIUM_EN(fontSize) ([UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium])

// 标准 - 英文
#define FCFont_REGULAR_EN(fontSize) ([UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular])

/// common - 中文
// 粗体
#define FCFont_SEMIBOLD(fontSize) ([UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize])

// 中
#define FCFont_MEDIUM(fontSize) ([UIFont fontWithName:@"PingFangSC-Medium" size:fontSize])

// 标准
#define FCFont_REGULAR(fontSize) ([UIFont fontWithName:@"PingFangSC-Regular" size:fontSize])

#endif /* FCFontMacro_h */
