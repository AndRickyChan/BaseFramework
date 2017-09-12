//
//  UserDefaultUtils.h
//  NetMVCDemo
//
//  Created by rickychan on 2017/9/5.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultUtils : NSObject

+(void)saveValue:(id) value forKey:(NSString *)key;

+(id)valueForKey:(NSString *)key;

+(id)StringForKey:(NSString *)key;

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key;

+(BOOL)boolValueForKey:(NSString *)key;

+(void)printAllUserDefault;

@end
