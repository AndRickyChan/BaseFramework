//
//  HomeViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>
{
    HomeView *_homeView;
}

@property(nonatomic,strong)NSMutableArray *bannerArrays;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
    _homeView = [[HomeView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_homeView];
    _homeView.bannerView.delegate = self;
    _homeView.bannerView.imageURLStringsGroup = self.bannerArrays;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

-(NSMutableArray *)bannerArrays{
    if (_bannerArrays == nil) {
        _bannerArrays = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg"].mutableCopy;
    }
    return _bannerArrays;
}

@end
