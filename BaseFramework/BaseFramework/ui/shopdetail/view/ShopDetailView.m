//
//  ShopDetailView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/15.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ShopDetailView.h"

@implementation ShopDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _shopLogoView = [[UIImageView alloc]init];
        _shopLogoView.backgroundColor = PRIMARY_COLOR;
        [self addSubview:_shopLogoView];
        [_shopLogoView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.top);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.height.equalTo(200);
        }];
    }
    return self;
}

@end
