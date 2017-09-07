//
//  APIRequest.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum APIRequestMethodType{
    APIRequestMethodTypeGet,
    APIRequestMethodTypePost
}APIRequestMethodType;

#define defaultTimeOutSeconds 15


@interface APIRequest : NSObject

@property(nonatomic,readonly)NSString *fullPath;

@property(nonatomic,readonly)NSString *servicePath;

@property(nonatomic,copy)NSString *urlAction;

@property(nonatomic,assign)APIRequestMethodType methodType;

@property(nonatomic,strong)NSMutableDictionary *paramDict;

@property(nonatomic,readonly)NSTimeInterval timeout;

@property(nonatomic,copy)NSString *requestTag;

-(id)initWithTag:(NSString *)requestTag;

@end
