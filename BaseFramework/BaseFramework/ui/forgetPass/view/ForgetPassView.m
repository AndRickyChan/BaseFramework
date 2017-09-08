//
//  ForgetPassView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ForgetPassView.h"

@implementation ForgetPassView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        label.text = @"找回密码";
        label.textColor = TITLE_COLOR;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor yellowColor];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(self.centerY);
            make.centerX.equalTo(self.centerX);
            make.size.equalTo(CGSizeMake(100, 100));
        }];
    }
    return self;
}

@end
