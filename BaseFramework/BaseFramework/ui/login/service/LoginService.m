//
//  LoginService.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "LoginService.h"

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

}

@end
