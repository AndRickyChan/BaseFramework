//
//  LoginView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int padding = 16;
        NSString *phoneStr = @"用户名:";
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = phoneStr;
        phoneLabel.textColor = TITLE_COLOR;
        phoneLabel.font = [UIFont systemFontOfSize:13];
        CGSize phoneSize = [SizeUtils sizeWithString:phoneStr font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(100, 16)];
        [self addSubview:phoneLabel];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.left).offset(50);
            make.top.equalTo(self.top).offset(100);
            make.size.equalTo(phoneSize);
        }];
        
        _phoneField = [[UITextField alloc]init];
        _phoneField.textColor = CONTENT_COLOR;
        _phoneField.font = [UIFont systemFontOfSize:12];
        _phoneField.layer.masksToBounds = YES;
        _phoneField.layer.borderColor = TIP_COLOR.CGColor;
        _phoneField.layer.borderWidth = 1;
        _phoneField.layer.cornerRadius = 4;
        _phoneField.placeholder = @"请输入电话号码";
        [_phoneField setValue:[NSNumber numberWithInteger:8] forKey:@"paddingLeft"];
        [self addSubview:_phoneField];
        [_phoneField mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(phoneLabel.right).offset(padding/2);
            make.right.equalTo(self.right).offset(-50);
            make.centerY.equalTo(phoneLabel.centerY);
            make.height.equalTo([NSNumber numberWithInteger:30]);
        }];
        
        UILabel *passLabel = [[UILabel alloc]init];
        passLabel.text = @"密   码:";
        passLabel.textColor = TITLE_COLOR;
        passLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:passLabel];
        [passLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(phoneLabel.left);
            make.right.equalTo(phoneLabel.right);
            make.height.equalTo(phoneLabel.height);
            make.top.equalTo(phoneLabel.bottom).offset(padding*2);
        }];
        
        _passwordField = [[UITextField alloc]init];
        _passwordField.font = [UIFont systemFontOfSize:12];
        _passwordField.textColor = CONTENT_COLOR;
        _passwordField.layer.masksToBounds = YES;
        _passwordField.layer.borderColor = TIP_COLOR.CGColor;
        _passwordField.layer.borderWidth = 1;
        _passwordField.layer.cornerRadius = 4;
        _passwordField.placeholder = @"请输入密码";
        [_passwordField setValue:[NSNumber numberWithInteger:8] forKey:@"paddingLeft"];
        [self addSubview:_passwordField];
        [_passwordField mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_phoneField.left);
            make.right.equalTo(_phoneField.right);
            make.centerY.equalTo(passLabel.centerY);
            make.height.equalTo(_phoneField.height);
        }];
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitleColor:UIColorFromRGBWithAlpha(0xffffff, 0.4) forState:UIControlStateHighlighted];
        _loginBtn.backgroundColor = PRIMARY_COLOR;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 22;
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(phoneLabel.left).offset(padding);
            make.right.equalTo(_phoneField.right).offset(-padding);
            make.top.equalTo(_passwordField.bottom).offset(padding*2);
            make.height.equalTo(44);
        }];
        
        UIView *dividerView = [[UIView alloc]init];
        dividerView.backgroundColor = TIP_COLOR;
        [self addSubview:dividerView];
        [dividerView mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerX.equalTo(self.centerX);
            make.width.equalTo([NSNumber numberWithInteger:1]);
            make.height.equalTo([NSNumber numberWithInteger:16]);
            make.top.equalTo(_loginBtn.bottom).offset(padding);
        }];
        
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:PRIMARY_COLOR forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:UIColorFromRGBWithAlpha(0xff4754, 0.4) forState:UIControlStateHighlighted];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_forgetBtn];
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(dividerView.left).offset(-padding/2);
            make.centerY.equalTo(dividerView.centerY);
        }];
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:PRIMARY_COLOR forState:UIControlStateNormal];
        [_registerBtn setTitleColor:UIColorFromRGBWithAlpha(0xff4754, 0.4) forState:UIControlStateHighlighted];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(dividerView.right).offset(padding/2);
            make.centerY.equalTo(dividerView.centerY);
        }];
    }
    return self;
}

@end
