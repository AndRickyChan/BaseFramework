//
//  ShopViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopView.h"
#import "ShopCell.h"
#import "ShopModel.h"
#import "ShopDetailViewController.h"

@interface ShopViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    ShopView *_shopView;
}

@property(nonatomic,strong)NSMutableArray<ShopModel *> *dataArryas;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    CGRect mainRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-55);
    _shopView = [[ShopView alloc]initWithFrame:mainRect];
    [self.view addSubview:_shopView];
    _shopView.tableView.delegate = self;
    _shopView.tableView.dataSource = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshShopData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    _shopView.tableView.mj_header = header;
    _shopView.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShop)];
}

-(void)refreshShopData{
    NSLog(@"开始刷新...");
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer *timer){
        [_shopView.tableView.mj_header endRefreshing];
    }];
}

-(void)loadMoreShop{
    NSLog(@"开始加载更多...");
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer *timer){
        [_shopView.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark uitableview delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArryas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopCell *cell = [[ShopCell alloc]initWithTableView:tableView];
    [cell setModelForShop:self.dataArryas[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShopDetailViewController *detailController = [[ShopDetailViewController alloc]init];
    ShopModel *model = self.dataArryas[indexPath.row];
    detailController.shopId = model.shopId;
    detailController.shopName  = model.shopNameStr;
    [self pushController:detailController];
}



#pragma mark 重写dataArryas getter方法
-(NSMutableArray *)dataArryas{
    if (_dataArryas == nil) {
        ShopModel *model = [[ShopModel alloc]init];
        model.shopId = 1;
        model.shopIconStr = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg";
        model.shopNameStr = @"家家腊鱼馆";
        model.shopTypeStr = @"土家特色菜馆";
        model.averagePriceStr = @"50";
        model.shopAddressStr = @"湖北省恩施市金桂大道新天地中间不知道在哪个卡卡国国里面";
        _dataArryas = @[model,model,model,model,model,model].mutableCopy;
    }
    return _dataArryas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
