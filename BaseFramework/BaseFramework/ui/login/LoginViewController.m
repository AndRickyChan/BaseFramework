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
    [_loginService loginWithPhone:phoneStr andPass:passStr];
}

-(void)forgetPassClicked:(UIButton *)sender{

}

-(void)registerClicked:(UIButton *)sender{

}

#pragma mark login delegate begin 

-(void)loginFailed:(NSString *)message{
    [self hideProgress];
    
}

-(void)loginSuccess{
    [self hideProgress];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
