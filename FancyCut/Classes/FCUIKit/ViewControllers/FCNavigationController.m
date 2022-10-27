//
//  FCNavigationController.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "FCNavigationController.h"
#import "UIView+FCFrame.h"

@interface FCNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *shadowImageView;

@end

@implementation FCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    __weak typeof(self) weakSelf = self;
    self.delegate = weakSelf;
}

#pragma mark - Public Method

- (void)fc_setShadowImageHidden:(BOOL)hidden {
    self.shadowImageView.hidden = hidden;
}

#pragma mark - Override Method

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 非根控制器，隐藏底部 tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // 完全展示出VC时，启用侧滑返回手势
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    // 解决根视图左滑页面卡死
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

// 接受多手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

#pragma mark - Private Method

- (UIImageView *)findShadowImageView:(UIView *)view {
    if ([view isKindOfClass:[UIImageView class]] && view.fc_height <= 1.0f) {
        return (UIImageView *)view;
    }
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self findShadowImageView:subView];
        if (imageView != nil) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - Getter Method

- (UIImageView *)shadowImageView {
    if (!_shadowImageView) {
        _shadowImageView = [self findShadowImageView:self.navigationBar];
    }
    return _shadowImageView;
}

@end
