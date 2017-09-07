//
//  APIRequest.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "APIRequest.h"

@implementation APIRequest

-(NSString *)fullPath{
    return [NSString stringWithFormat:@"%@%@",self.servicePath,self.urlAction];
}

-(NSString *)servicePath{
    return url_request_base;
}

-(NSTimeInterval)timeout{
    return defaultTimeOutSeconds;
}

-(id)initWithTag:(NSString *)requestTag{
    self = [super init];
    if (self) {
        //self.paramDict = [NSMutableDictionary dictionary];
        self.requestTag = requestTag;
    }
    return self;
}

@end
