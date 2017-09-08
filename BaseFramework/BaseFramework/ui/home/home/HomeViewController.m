//
//  HomeViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()
{
    HomeView *_homeView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
    _homeView = [[HomeView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_homeView];
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
