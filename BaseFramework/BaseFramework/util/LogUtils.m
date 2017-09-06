//
//  LogUtils.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "LogUtils.h"

@implementation LogUtils

+(void)log:(NSString *)message{
    if (DEBUG) {
        NSLog(@"%@",message);
    }
}

@end
