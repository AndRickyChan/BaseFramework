//
//  UserDefaultUtils.m
//  NetMVCDemo
//
//  Created by rickychan on 2017/9/5.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "UserDefaultUtils.h"

@implementation UserDefaultUtils

+(void)saveValue:(id) value forKey:(NSString *)key{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:value forKey:key];
    [userdefaults synchronize];
}

+(id)valueForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+(id)StringForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
}

+(BOOL)boolValueForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+(void)printAllUserDefault{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [userDefaults dictionaryRepresentation];
    [LogUtils log:[NSString stringWithFormat:@"%@",dict]];
}

@end
