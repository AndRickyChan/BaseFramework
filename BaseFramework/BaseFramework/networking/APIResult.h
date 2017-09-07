//
//  APIResult.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIResult : NSObject

@property(nonatomic,assign) NSInteger code;

@property(nonatomic,assign)BOOL success;

@property(nonatomic,copy)NSString *message;

@property(nonatomic,strong)NSMutableDictionary *result;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
