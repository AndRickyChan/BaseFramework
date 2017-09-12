//
//  UserInfoView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/11.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "UserInfoView.h"

@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc]init];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.bounces = NO;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.backgroundColor = BACKGROUND_COLOR;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.top.equalTo(self.top).offset(8);
            make.bottom.equalTo(self.bottom);
        }];
    }
    return self;
}

@end
