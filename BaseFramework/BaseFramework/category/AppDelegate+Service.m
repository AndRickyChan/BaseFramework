//
//  AppDelegate+Service.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AppDelegate+Service.h"

@implementation AppDelegate (Service)

-(void)configurationNormal{
    [LogUtils log:@"基础配置中...."];
}

-(void)registerUmeng{
    [LogUtils log:@"注册友盟...."];
}

-(void)registerJPush{
    [LogUtils log:@"注册极光推送...."];
}

@end
