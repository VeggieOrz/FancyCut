//
//  UIView+FCFrame.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "UIView+FCFrame.h"

@implementation UIView (FCFrame)

#pragma mark - Getter Method

- (CGFloat)fc_x {
    return self.bounds.origin.x;
}

- (CGFloat)fc_y {
    return self.bounds.origin.y;
}

- (CGFloat)fc_width {
    return self.bounds.size.width;
}

- (CGFloat)fc_height {
    return self.bounds.size.height;
}

- (CGPoint)fc_origin {
    return self.bounds.origin;
}

- (CGSize)fc_size {
    return self.bounds.size;
}

#pragma mark - Setter Method

- (void)setFc_x:(CGFloat)fc_x {
    CGRect frame = self.frame;
    frame.origin.x = fc_x;
    self.frame = frame;
}

- (void)setFc_y:(CGFloat)fc_y {
    CGRect frame = self.frame;
    frame.origin.y = fc_y;
    self.frame = frame;
}

- (void)setFc_width:(CGFloat)fc_width {
    CGRect frame = self.frame;
    frame.size.width = fc_width;
    self.frame = frame;
}

- (void)setFc_height:(CGFloat)fc_height {
    CGRect frame = self.frame;
    frame.size.height = fc_height;
    self.frame = frame;
}

- (void)setFc_origin:(CGPoint)fc_origin {
    CGRect frame = self.frame;
    frame.origin = fc_origin;
    self.frame = frame;
}

- (void)setFc_size:(CGSize)fc_size {
    CGRect frame = self.frame;
    frame.size = fc_size;
    self.frame = frame;
}

@end
