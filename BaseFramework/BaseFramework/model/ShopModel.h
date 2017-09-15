//
//  ShopModel.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/15.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ShopModel : JSONModel

@property(nonatomic,assign)NSInteger shopId;

@property(nonatomic,copy)NSString *shopIconStr;

@property(nonatomic,copy)NSString *shopNameStr;

@property(nonatomic,copy)NSString *shopTypeStr;

@property(nonatomic,copy)NSString *averagePriceStr;

@property(nonatomic,copy)NSString *shopAddressStr;

@end
