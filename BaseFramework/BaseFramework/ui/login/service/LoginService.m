//
//  LoginService.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "LoginService.h"
#import "UserDefaultUtils.h"

@implementation LoginService

-(id)initWithDelegate:(id<LoginDelegate>)delegate{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

-(BOOL)checkPhoneValidate:(NSString *)phone{
    return YES;
}

-(BOOL)checkPassValidate:(NSString *)password{
    return YES;
}

-(void)loginWithPhone:(NSString *)phone andPass:(NSString *)password{
    APIRequest *request = [[APIRequest alloc]initWithTag:@"userLogin"];
    request.urlAction = url_request_type_login;
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"1" forKey:@"lun"];
    [param setObject:@"1" forKey:@"pwd"];
    request.paramDict = param;
    request.methodType = APIRequestMethodTypePost;
    [[APIClient shareInstance]executeWithApi:request success:^(APIRequest *api,APIResult *result){
        [UserDefaultUtils saveBoolValue:true forKey:IS_LOGIN];
        if (self.delegate && [self.delegate respondsToSelector:@selector(loginSuccess)]) {
            [self.delegate loginSuccess];
        }
    } failed:^(APIRequest *api,NSError *error){
        [UserDefaultUtils saveBoolValue:true forKey:IS_LOGIN];
        if(self.delegate && [self.delegate respondsToSelector:@selector(loginFailed:)]){
            [self.delegate loginFailed:error.domain];
        }
    }];
}

@end
