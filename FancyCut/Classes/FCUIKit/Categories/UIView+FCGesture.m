//
//  UIView+FCGesture.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "UIView+FCGesture.h"
#import <objc/runtime.h>

#define enumToString(value) @#value

static const char *FCGestureBlockKey;

@implementation UIView (FCGesture)


- (UITapGestureRecognizer *)fc_addTapGestureRecognizerWithBlock:(FCGestureBlock)block {
    UIGestureRecognizer *tapGesture = [self fc_addGestureRecognizer:FCGestureType_Tap block:block];
    if ([tapGesture isKindOfClass:UITapGestureRecognizer.class]) {
        return (UITapGestureRecognizer *)tapGesture;
    }
    return nil;
}

- (UITapGestureRecognizer *)fc_addTapGestureRecognizerWithTarget:(id)target action:(SEL)sel {
    UIGestureRecognizer *tapGesture = [self fc_addGestureRecognizer:FCGestureType_Tap target:target action:sel];
    if ([tapGesture isKindOfClass:UITapGestureRecognizer.class]) {
        return (UITapGestureRecognizer *)tapGesture;
    }
    return nil;
}

- (UIGestureRecognizer *)fc_addGestureRecognizer:(FCGestureType)type block:(FCGestureBlock)block {
    if (block) {
        NSString *gestureClassString = [self gestureTypeString:type];
        if (gestureClassString) {
            self.userInteractionEnabled = YES;
            UIGestureRecognizer *gesture = [[NSClassFromString(gestureClassString) alloc] initWithTarget:self action:@selector(gestureAction:)];
            if (gesture) {
                [self addGestureRecognizer:gesture];
                NSMutableDictionary *blockDic = objc_getAssociatedObject(self, FCGestureBlockKey);
                if (!blockDic) {
                    blockDic = @{}.mutableCopy;
                    objc_setAssociatedObject(self, FCGestureBlockKey, blockDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                [blockDic setObject:block forKey:gestureClassString];

                return gesture;
            }
        }
    }
    return nil;
}

- (UIGestureRecognizer *)fc_addGestureRecognizer:(FCGestureType)type target:(id)target action:(SEL)sel {
    NSString *gestureClassString = [self gestureTypeString:type];
    if (gestureClassString) {
        self.userInteractionEnabled = YES;
        UIGestureRecognizer *gesture = [[NSClassFromString(gestureClassString) alloc] initWithTarget:target action:sel];
        if (gesture) {
            [self addGestureRecognizer:gesture];
            return gesture;
        }
    }
    return nil;
}

- (void)gestureAction:(UIGestureRecognizer *)gesture {
    NSMutableDictionary *blockDic = objc_getAssociatedObject(gesture.view, FCGestureBlockKey);
    FCGestureBlock block = blockDic[NSStringFromClass([gesture class])];
    
    if (block) {
        block(gesture.view, gesture);
    }
}

- (NSString *)gestureTypeString:(FCGestureType)type {
    switch (type) {
        case FCGestureType_Tap:
            return @"UITapGestureRecognizer";
        case FCGestureType_LongPress:
            return @"UILongPressGestureRecognizer";
        case FCGestureType_Swipe:
            return @"UISwipeGestureRecognizer";
        case FCGestureType_Pan:
            return @"UIPanGestureRecognizer";
        case FCGestureType_Rotate:
            return @"UIRotationGestureRecognizer";
        case FCGestureType_Pinch:
            return @"UIPinchGestureRecognizer";
        default:
            return nil;
    }
}

@end
