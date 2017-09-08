//
//  AppUtils.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/8.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

+(NSString *)getAppName{
    NSDictionary *dict = [[NSBundle mainBundle]infoDictionary];
    return [dict objectForKey:@"CFBundleDisplayName"];
}

+(NSString *)getAppVersion{
    NSDictionary *dict = [[NSBundle mainBundle]infoDictionary];
    return [dict objectForKey:@"CFBundleShortVersionString"];
}

+(NSString *)getAppBuildVersion{
    NSDictionary *dict = [[NSBundle mainBundle]infoDictionary];
    return [dict objectForKey:@"CFBundleVersion"];
}

@end
