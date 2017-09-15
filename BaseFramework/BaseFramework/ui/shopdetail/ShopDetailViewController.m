//
//  ShopDetailViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/15.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "ShopDetailView.h"

@interface ShopDetailViewController ()
{
    ShopDetailView *_shopDetailView;
}

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.shopName;
    _shopDetailView = [[ShopDetailView alloc]initWithFrame:NAVIGATION_RECT];
    [self.view addSubview:_shopDetailView];
    [_shopDetailView.shopLogoView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg"]];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
