//
//  UIView+FCFrame.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 快速获取UIView的bounds信息
/// @note 使用 setter 方法会使View原本的 frame 指针失效

@interface UIView (FCFrame)

@property (nonatomic, assign) CGFloat fc_x;
@property (nonatomic, assign) CGFloat fc_y;
@property (nonatomic, assign) CGFloat fc_width;
@property (nonatomic, assign) CGFloat fc_height;
@property (nonatomic, assign) CGSize fc_size;
@property (nonatomic, assign) CGPoint fc_origin;

@end

NS_ASSUME_NONNULL_END
