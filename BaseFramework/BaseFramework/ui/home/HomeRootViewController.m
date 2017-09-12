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
    ShopViewController *shop = [[ShopViewController alloc]init];
    MineViewController *mine = [[MineViewController alloc]init];
    
    UINavigationController *homeNav = [self setOneController:home title:@"首页" image:nil selectedImage:nil];
    UINavigationController *shopNav = [self setOneController:shop title:@"商店" image:nil selectedImage:nil];
    UINavigationController *mineNav = [self setOneController:mine title:@"我的" image:nil selectedImage:nil];
    
    self.viewControllers = @[homeNav,shopNav,mineNav];
    
}

-(UINavigationController *)setOneController:(UIViewController *)viewController title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    viewController.navigationItem.title = title;
    nav.tabBarItem.title = title;
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
