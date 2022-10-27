//
//  FCEditViewController.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/27.
//

#import "FCEditViewController.h"
#import "FCUIKit.h"
#import <Masonry/Masonry.h>

@interface FCEditViewController ()

@property (nonatomic, strong) UIView *jumpToEditView;

@end

@implementation FCEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubview];
}

- (void)setupSubview {
    self.view.backgroundColor = UIColor.greenColor;
    [self.view addSubview:self.jumpToEditView];
    [self.jumpToEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(100);
        make.center.equalTo(self.view);
    }];
}

- (UIView *)jumpToEditView {
    if (!_jumpToEditView) {
        _jumpToEditView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = UIColor.redColor;
            [view fc_addTapGestureRecognizerWithBlock:^(UIView * _Nonnull view, UIGestureRecognizer * _Nonnull gesture) {
                NSLog(@"%@", @"jump to edit");
            }];
            view;
        });
    }
    return _jumpToEditView;
}

@end
