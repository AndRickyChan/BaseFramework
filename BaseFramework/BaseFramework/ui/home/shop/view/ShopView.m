//
//  ShopView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ShopView.h"

@implementation ShopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.estimatedRowHeight = 110;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.left);
            make.top.equalTo(self.top);
            make.right.equalTo(self.right);
            make.bottom.equalTo(self.bottom);
        }];
    }
    return self;
}

@end
