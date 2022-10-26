//
//  FCBaseViewController.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "FCBaseViewController.h"
#import "FCNavigationController.h"
#import "UIColor+FCColor.h"
#import "FCFontMacro.h"

@interface FCBaseViewController ()

@property (nonatomic, strong) UIButton *p_backButton;
@property (nonatomic, strong) UILabel *p_titleLabel;

@end

@implementation FCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.fc_hideNavigationBar) {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.fc_hideNavigationBar) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

#pragma mark - Public Method

- (void)fc_setTitle:(NSString *)title {
    self.p_titleLabel.text = title;
}

- (void)fc_setupRightButton {
    // 子类重写
}

#pragma mark - Action

- (void)fc_didTapBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI About

- (void)p_setupNavigationBar {
    // 隐藏导航栏横线
    if ([self.navigationController isKindOfClass:[FCNavigationController class]]) {
        [(FCNavigationController *)self.navigationController fc_setShadowImageHidden:YES];
    }
    
    // 设置左边的返回按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.p_backButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    // 设置中间的标题
    self.navigationItem.titleView = self.p_titleLabel;
    
    // 设置右边的返回按钮
    [self fc_setupRightButton];
}

#pragma mark - Getter Method

- (UIButton *)p_backButton {
    if (!_p_backButton) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //    backButton.imageEdgeInsets = UIEdgeInsetsMake(11, 0, 11, 28);
        UIImage *backImage = [UIImage imageNamed:@"navigation_back"];
        [backButton setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(fc_didTapBackButton) forControlEvents:UIControlEventTouchUpInside];
        
        _p_backButton = backButton;
    }
    return _p_backButton;
}

- (UILabel *)p_titleLabel {
    if (!_p_titleLabel) {
        _p_titleLabel = [UILabel new];
        _p_titleLabel.textColor = [UIColor fc_colorWithHexString:@"#1E1E1E"];
        _p_titleLabel.font = FCFont_MEDIUM(17);
    }
    return _p_titleLabel;
}

@end
