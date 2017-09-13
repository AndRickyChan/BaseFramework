//
//  APIClient.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccess)(APIRequest *api,APIResult *result);
typedef void(^RequestError)(APIRequest *api,NSError *error);

@interface APIClient : NSObject

+(id)shareInstance;

-(void)executeWithApi:(APIRequest *)api success:(RequestSuccess)success failed:(RequestError)failed;

-(void)executeUploadPostWithApi:(APIRequest *)api name:(NSString *)name mimeType:(NSString *)fileType image:(UIImage *)image success:(RequestSuccess)success failed:(RequestError)failed;

@end
