//
//  AppDelegate+RootController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "LoginViewController.h"

@implementation AppDelegate (RootController)

-(void)setAppWindow{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //返回按钮颜色
    UINavigationBar.appearance.tintColor = [UIColor whiteColor];
    //标题颜色
    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //导航栏颜色
    UINavigationBar.appearance.barTintColor = PRIMARY_COLOR;
    [self.window makeKeyAndVisible];
}

-(void)setRootController{
    LoginViewController *viewController = [[LoginViewController alloc]init];
    self.window.rootViewController = viewController;
}

@end
