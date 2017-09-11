//
//  MineService.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/11.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MineDelegate <NSObject>

-(void)initDataSuccess:(NSString *)header nickName:(NSString *)nickName;

@end

@interface MineService : NSObject

@property(nonatomic,weak) id<MineDelegate>delegate;

-(id)initWithDelegate:(id<MineDelegate>) delegate;

-(void)shareInitData;

@end
