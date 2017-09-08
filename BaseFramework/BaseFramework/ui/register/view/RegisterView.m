//
//  RegisterView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"注册";
        label.backgroundColor = [UIColor yellowColor];
        label.textColor = TITLE_COLOR;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerX.equalTo(self.centerX);
            make.centerY.equalTo(self.centerY);
            make.size.equalTo(CGSizeMake(100, 100));
        }];
    }
    return self;
}

@end
