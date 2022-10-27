//
//  FCBaseViewController.h
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCBaseViewController : UIViewController

@property (nonatomic, assign) BOOL fc_hideNavigationBar;

/// 供子类重写，默认实现为返回上一页面
- (void)fc_didTapBackButton;

/// 供子类重写，设置右边按钮
- (void)fc_setupRightButton;

/// 设置导航栏标题
/// @param title 标题字符串
- (void)fc_setTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
