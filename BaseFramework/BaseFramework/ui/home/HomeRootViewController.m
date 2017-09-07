//
//  HomeRootViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "HomeRootViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "ShopViewController.h"

@interface HomeRootViewController ()

@end

@implementation HomeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAllViewController];
}

-(void)setAllViewController{
    //self.itemTitleFont = [UIFont systemFontOfSize:15];
    self.itemTitleColor = TITLE_COLOR;
    self.selectedItemTitleColor = PRIMARY_COLOR;
    
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    home.navigationItem.title = @"首页";
    homeNav.tabBarItem.title = @"首页";
    
    ShopViewController *shop = [[ShopViewController alloc]init];
    UINavigationController *shopNav = [[UINavigationController alloc]initWithRootViewController:shop];
    shop.navigationItem.title = @"商店";
    shopNav.tabBarItem.title = @"商店";
    
    MineViewController *mine = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mine];
    mine.navigationItem.title = @"我的";
    mineNav.tabBarItem.title = @"我的";
    
    self.viewControllers = @[homeNav,shopNav,mineNav];
    
}

-(void)setOneViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectImage title:(NSString *)title{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selectImage;
    viewController.navigationItem.title = title;
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
