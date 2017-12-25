//
//  AppDelegate.m
//  zichen
//
//  Created by 郑超华 on 2017/12/25.
//  Copyright © 2017年 郑超华. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:1.5];
    [LBNetWorkHelper startMonitoringNetwork];
#pragma mark - 测试环境:00,   生产环境:01
    [LBServeConfig setLBConfigEnv:@"01"];
    [self configurationIQKeyboard];
    [self setBarStyle];
    [self setupIntroductoryPage];
    return YES;
}
#pragma mark - 引导页
-(void)setupIntroductoryPage {
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    //获取上次启动应用保存的appVersion
    NSString *version = kUserDefaultObjectForKey(@"kAppVersion");
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        kUserDefaultSetObjectForKey(currentAppVersion, @"kAppVersion");
        GuideViewController *guideVC = [GuideViewController new];
        LBWeakSelf(self)
        guideVC.guideBtnBlock = ^() {
            [weakself loginIn];
        };
        self.window.rootViewController = guideVC;
    }else{
        [self loginIn];
    }
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
}
#pragma mark - 登录
- (void)loginIn {
        if (![LBHTTPRequest isLogin]) {//未登录  --> 登录界面
            LoginViewController *LoginVC = [[LoginViewController alloc] init];
            [self.window setRootViewController:LoginVC];
        }else{ //进入首页
            
//            self.window.rootViewController = ;
        }
}
#pragma mark - 配置IQKeyboardManager
- (void)configurationIQKeyboard {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}
#pragma mark - 统一设置navigationBar的样式
- (void)setBarStyle {
    [[UINavigationBar appearance] setBarTintColor:kBGCOLOR ];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:19]};
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
