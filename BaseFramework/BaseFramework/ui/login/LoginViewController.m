//
//  LoginViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "LoginView.h"
#import "HomeRootViewController.h"
#import "RegisterViewController.h"
#import "ForgetPassViewController.h"

@interface LoginViewController ()<LoginDelegate>
{
    LoginView *_loginView;
    LoginService *_loginService;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginService = [[LoginService alloc]initWithDelegate:self];
    _loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_loginView];
    
    [_loginView.loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.forgetBtn addTarget:self action:@selector(forgetPassClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.registerBtn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loginClicked:(UIButton *)sender{
    NSString *phoneStr = _loginView.phoneField.text;
    NSString *passStr = _loginView.passwordField.text;
    if (![_loginService checkPhoneValidate:phoneStr]) {
        [self showToast:@"请输入正确的电话号码"];
        return ;
    }
    if (![_loginService checkPassValidate:passStr]) {
        [self showToast:@"请输入正确的密码格式"];
        return ;
    }
    if ([_loginService checkPhoneValidate:phoneStr] && [_loginService checkPassValidate:passStr]) {
        [self showProgress];
        [_loginService loginWithPhone:phoneStr andPass:passStr];
    }
}

-(void)forgetPassClicked:(UIButton *)sender{
    UINavigationController *forgetPassNav = [[UINavigationController alloc]initWithRootViewController:[[ForgetPassViewController alloc]init]];
    [self presentViewController:forgetPassNav animated:YES completion:nil];
}

-(void)registerClicked:(UIButton *)sender{
    RegisterViewController *registerView = [[RegisterViewController alloc]init];
    UINavigationController *registerNav = [[UINavigationController alloc]initWithRootViewController:registerView];
    [self presentViewController:registerNav animated:YES completion:nil];
}

#pragma mark login delegate begin 

-(void)loginFailed:(NSString *)message{
    [self hideProgress];
    [self showToast:@"登录失败..."];
    [self toHomeRootController];
}

-(void)loginSuccess{
    [self hideProgress];
    [self showToast:@"登录成功...."];
    [self toHomeRootController];
}

-(void)toHomeRootController{
    HomeRootViewController *controller = [[HomeRootViewController alloc]init];
    [UIApplication sharedApplication].delegate.window.rootViewController = controller;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
