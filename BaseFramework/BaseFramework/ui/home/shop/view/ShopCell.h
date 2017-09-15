//
//  ShopCell.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/15.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface ShopCell : UITableViewCell

@property(nonatomic,strong)UIImageView *shopIconView;

@property(nonatomic,strong)UILabel *shopNameView;

@property(nonatomic,strong)UILabel *shopTypeView;

@property(nonatomic,strong)UILabel *averagePriceView;

@property(nonatomic,strong)UILabel *shopAddressView;

-(id)initWithTableView:(UITableView *)tableView;

-(void)setModelForShop:(ShopModel *)model;

@end
