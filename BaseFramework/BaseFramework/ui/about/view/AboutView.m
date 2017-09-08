//
//  AboutView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/8.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = PRIMARY_COLOR;
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 4;
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.top).offset(100);
            make.centerX.equalTo(self.centerX);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
        
        UILabel *copyright = [[UILabel alloc]init];
        copyright.textColor = SUB_CONTENT_COLOR;
        copyright.font = [UIFont systemFontOfSize:11];
        NSString *copyStr = @"© Ricky. All Rights Reserved";
        copyright.text = copyStr;
        [self addSubview:copyright];
        CGSize copySize = [SizeUtils sizeWithString:copyStr font:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        [copyright mas_makeConstraints:^(MASConstraintMaker *make){
            make.bottom.equalTo(self.bottom).offset(-16);
            make.centerX.equalTo(self.centerX);
            make.size.equalTo(copySize);
        }];
        
        _tableView = [[UITableView alloc]init];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.bounces = NO;
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(imageView.bottom).offset(30);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.bottom.equalTo(copyright.top);
        }];
        
    }
    return self;
}

@end
