//
//  AppDelegate.m
//  FancyCut
//
//  Created by liuweihong.veggie on 2022/10/25.
//

#import "AppDelegate.h"
#import "FCMainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 初始化 self.window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    FCMainTabBarController *tabVc = [[FCMainTabBarController alloc] init];
    // 设置根控制器并可视
    [self.window setRootViewController:tabVc];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - UIApplicationDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
