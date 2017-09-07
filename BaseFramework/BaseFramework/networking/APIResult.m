//
//  APIResult.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "APIResult.h"

@implementation APIResult

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        @try {
            if (dict) {
                self.code = [[dict objectForKey:@"code"] integerValue];
                self.message = [dict objectForKey:@"msg"];
                if (self.code == 1) {
                    //成功
                    self.success = YES;
                    self.result = [dict objectForKey:@"data"];
                }else{
                    self.success = NO;
                    self.result = nil;
                }
            }else{
                self.code = 0;
                self.success = NO;
                self.result = nil;
                self.message = @"数据返回为空";
            }
        } @catch (NSException *exception) {
            self.code = 0;
            self.success = NO;
            self.result = nil;
            self.message = @"数据解析错误";
        } @finally {
            
        }
    }
    return self;
}

@end
