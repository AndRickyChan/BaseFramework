//
//  LoginService.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginDelegate <NSObject>

-(void)loginSuccess;

-(void)loginFailed:(NSString *)message;

@end

@interface LoginService : NSObject

@property(nonatomic,weak) id<LoginDelegate>delegate;

-(id)initWithDelegate:(id<LoginDelegate>)delegate;

-(BOOL)checkPhoneValidate:(NSString *)phone;

-(BOOL)checkPassValidate:(NSString *)password;

-(void)loginWithPhone:(NSString *)phone andPass:(NSString *)password;

@end
