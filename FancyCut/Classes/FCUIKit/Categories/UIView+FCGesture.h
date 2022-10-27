//
//  UIView+FCGesture.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^FCGestureBlock)(UIView *view, UIGestureRecognizer *gesture);

typedef NS_ENUM (NSUInteger, FCGestureType) {
    FCGestureType_Tap,          // 点击
    FCGestureType_LongPress,    // 长按
    FCGestureType_Swipe,        // 轻扫
    FCGestureType_Pan,          // 移动
    FCGestureType_Rotate,       // 旋转
    FCGestureType_Pinch,        // 缩放
};

@interface UIView (FCGesture)

- (UITapGestureRecognizer *)fc_addTapGestureRecognizerWithBlock:(FCGestureBlock)block;
- (UITapGestureRecognizer *)fc_addTapGestureRecognizerWithTarget:(id)target action:(SEL)sel;
- (UIGestureRecognizer *)fc_addGestureRecognizer:(FCGestureType)type block:(FCGestureBlock)block;
- (UIGestureRecognizer *)fc_addGestureRecognizer:(FCGestureType)type target:(id)target action:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
