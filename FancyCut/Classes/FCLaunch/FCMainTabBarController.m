//
//  FCMainTabBarViewController.m
//  FancyCut
//
//  Created by yaoyimu on 2022/10/26.
//

#import "FCMainTabBarController.h"
#import "FCHomeViewController.h"
#import "FCEditViewController.h"
#import "FCMeViewController.h"

@interface FCMainTabBarController ()

@end

@implementation FCMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = UIColor.whiteColor;
    self.tabBar.translucent = NO;
    
    NSArray *configArray = @[
        @{
            @"class":@"FCHomeViewController",
            @"title":@"首页",
            @"image_none_selected":@"icon_tab_home_normal",
            @"image_selected":@"icon_tab_home_selected"
        },
        @{
            @"class":@"FCEditViewController",
            @"title":@"编辑",
            @"image_none_selected":@"icon_tab_edit_normal",
            @"image_selected":@"icon_tab_edit_selected"
        },
        @{
            @"class":@"FCMeViewController",
            @"title":@"我的",
            @"image_none_selected":@"icon_tab_me_normal",
            @"image_selected":@"icon_tab_me_selected"
        },
    ];
    
    [configArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(dict[@"class"]) new];
        FCNavigationController *navVC = [[FCNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = navVC.tabBarItem;
        item.title = dict[@"title"];
        item.image = [[UIImage imageNamed:dict[@"image_none_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:dict[@"image_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [item setTitleTextAttributes:@{
            NSForegroundColorAttributeName : [UIColor fc_colorWithHexString:@"#505050"],
            NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:11.0f]
        } forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{
            NSForegroundColorAttributeName : [UIColor fc_colorWithHexString:@"#10A4FF"],
            NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:11.0f]
        } forState:UIControlStateSelected];
        
        [self addChildViewController:navVC];
    }];
}

@end
