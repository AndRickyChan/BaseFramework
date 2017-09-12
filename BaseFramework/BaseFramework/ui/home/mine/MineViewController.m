//
//  MineViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "MineViewController.h"
#import "MineView.h"
#import "MineService.h"
#import "SettingViewController.h"
#import "UserInfoViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,MineDelegate>
{
    MineView *_mineView;
    MineService *_mineService;
}

@property(nonatomic,strong)NSMutableArray *mineArrays;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    _mineView = [[MineView alloc]initWithFrame:self.view.bounds];
    _mineView.tableView.dataSource = self;
    _mineView.tableView.delegate = self;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMyInfoController)];
    [_mineView.headerImageView addGestureRecognizer:recognizer];
    [self.view addSubview:_mineView];
    _mineService = [[MineService alloc]initWithDelegate:self];
    [_mineService shareInitData];
}

-(void)toMyInfoController{
    UserInfoViewController *controller = [[UserInfoViewController alloc]init];
    [self pushController:controller];
}

-(void)initDataSuccess:(NSString *)header nickName:(NSString *)nickName{
    [_mineView.headerImageView sd_setImageWithURL:[NSURL URLWithString:header ]];
    _mineView.userNickName.text = nickName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mineArrays.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"mineCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textColor = CONTENT_COLOR;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = self.mineArrays[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;

        case 2:
        {
            
        }
            break;
        case 3:
        {
            SettingViewController *setting = [[SettingViewController alloc]init];
            [self pushController:setting];
        }
            break;

            
        default:
            break;
    }
}

#pragma mark 懒加载
-(NSMutableArray *)mineArrays{
    if (_mineArrays == nil) {
        _mineArrays = @[@"我的账单",@"我的订阅",@"我的消息",@"设置"].mutableCopy;
    }
    return _mineArrays;
}

@end
