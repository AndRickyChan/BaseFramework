//
//  HomeView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        [self addSubview:_scrollView];
        
        _bannerView = [[SDCycleScrollView alloc]init];
        _bannerView.pageControlAliment = SDCycleScrollViewPageContolStyleAnimated;
        _bannerView.autoScrollTimeInterval = 2;
        [_scrollView addSubview:_bannerView];
        [_bannerView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.left);
            make.top.equalTo(self.top);
            make.right.equalTo(self.right);
            make.height.equalTo(200);
        }];
    }
    return self;
}

@end
