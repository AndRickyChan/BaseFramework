//
//  MineView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "MineView.h"

@implementation MineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        backView.backgroundColor = PRIMARY_COLOR;
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.backgroundColor = [UIColor greenColor];
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.layer.cornerRadius = 39;
        _headerImageView.userInteractionEnabled = YES;
        [backView addSubview:_headerImageView];
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerX.equalTo(backView.centerX);
            make.centerY.equalTo(backView.centerY).offset(-20);
            make.size.equalTo(CGSizeMake(78, 78));
        }];
        _userNickName = [[UILabel alloc]init];
        _userNickName.textColor = [UIColor whiteColor];
        _userNickName.font = [UIFont systemFontOfSize:14];
        _userNickName.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:_userNickName];
        [_userNickName mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(backView.left);
            make.right.equalTo(backView.right);
            make.top.equalTo(_headerImageView.bottom).offset(12);
        }];
        
        [self addSubview:backView];
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(backView.bottom);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.bottom.equalTo(self.bottom);
        }];
    }
    return self;
}

@end
