//
//  APIClient.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

+(id)shareInstance{
    static APIClient *client;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        client = [[APIClient alloc]init];
    });
    return client;
}

-(void)executeWithApi:(APIRequest *)api success:(RequestSuccess)success failed:(RequestError)failed{
    switch (api.methodType) {
        case APIRequestMethodTypeGet:
        {
            [self executeGetWithApi:api success:success failed:failed];
        }
            break;
        case APIRequestMethodTypePost:
        {
            [self executePostWithApi:api success:success failed:failed];
        }
            break;
        default:
            break;
    }
}

-(void)executeGetWithApi:(APIRequest *)api success:(RequestSuccess)success failed:(RequestError)failed{
    AFHTTPSessionManager *manager = [self shareManager:api];
    [manager GET:api.fullPath parameters:api.paramDict progress:nil success:^(NSURLSessionTask *task,id responseObject){
        [LogUtils log:[NSString stringWithFormat:@"%@---请求成功---%@",api.requestTag,responseObject]];
        NSDictionary *dict = (NSDictionary *)responseObject;
        APIResult *result = [[APIResult alloc]initWithDictionary:dict];
        if (result.success) {
            if (success) {
                success(api,result);
            }
        }else{
            if (failed) {
                if (result.message == nil) {
                    result.message = @"数据解析错误";
                }
                NSError *error = [NSError errorWithDomain:result.message code:result.code userInfo:nil];
                failed(api,error);
            }
        }
    } failure:^(NSURLSessionTask *task,NSError *error){
        [LogUtils log:[NSString stringWithFormat:@"%@--请求失败--%@",api.requestTag,error.domain]];
        if (failed) {
            failed(api,error);
        }
    }];
}

-(void)executePostWithApi:(APIRequest *)api success:(RequestSuccess)success failed:(RequestError)failed{
    AFHTTPSessionManager *manager = [self shareManager:api];
    [manager POST:api.fullPath parameters:api.paramDict progress:nil success:^(NSURLSessionTask *task,id responseObject){
        [LogUtils log:[NSString stringWithFormat:@"%@---请求成功---%@",api.requestTag,responseObject]];
        NSDictionary *dict = (NSDictionary *)responseObject;
        APIResult *result = [[APIResult alloc]initWithDictionary:dict];
        if (result.success) {
            if (success) {
                success(api,result);
            }
        }else{
            if (failed) {
                if (result.message == nil) {
                    result.message = @"数据解析错误";
                }
                NSError *error = [NSError errorWithDomain:result.message code:result.code userInfo:nil];
                failed(api,error);
            }
        }
    } failure:^(NSURLSessionTask *task,NSError *error){
        [LogUtils log:[NSString stringWithFormat:@"%@--请求失败--%@",api.requestTag,error.domain]];
        if (failed) {
            failed(api,error);
        }
    }];
}

-(AFHTTPSessionManager *)shareManager:(APIRequest *)api{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    //设置网络请求超时时间
    manager.requestSerializer.timeoutInterval =api.timeout;
    //设置数据请求格式
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //设置数据返回时格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //设置请求头
    [manager.requestSerializer setValue:@"123245234523" forHTTPHeaderField:@"Authorization Bear"];
    [manager.requestSerializer setValue:@"1.0" forHTTPHeaderField:@"app_version"];
    return manager;
}

@end
