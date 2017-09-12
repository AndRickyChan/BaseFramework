//
//  AppDelegate+RootController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "LoginViewController.h"
#import "UserDefaultUtils.h"
#import "HomeRootViewController.h"

@implementation AppDelegate (RootController)

-(void)setAppWindow{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //返回按钮颜色
    UINavigationBar.appearance.tintColor = [UIColor whiteColor];
    //标题颜色
    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //去掉导航栏自带的透明度
    UINavigationBar.appearance.translucent = NO;
    //导航栏颜色
    UINavigationBar.appearance.barTintColor = PRIMARY_COLOR;
    [self.window makeKeyAndVisible];
}

-(void)setRootController{
    BOOL isLogin = [UserDefaultUtils boolValueForKey:IS_LOGIN];
    if (isLogin) {
        HomeRootViewController *viewController = [[HomeRootViewController alloc]init];
        self.window.rootViewController = viewController;
    }else{
        LoginViewController *viewController = [[LoginViewController alloc]init];
        self.window.rootViewController = viewController;
    }
}

@end
