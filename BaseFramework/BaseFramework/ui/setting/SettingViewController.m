//
//  SettingViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/7.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"
#import "LoginViewController.h"
#import "AboutViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SettingView *_settingView;
}

@property(nonatomic,strong)NSMutableArray *settingArrays;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
    _settingView = [[SettingView alloc]initWithFrame:NAVIGATION_RECT];
    [self.view addSubview:_settingView];
    _settingView.tableView.dataSource = self;
    _settingView.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.settingArrays.count;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"settingCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = CONTENT_COLOR;
        cell.textLabel.text = self.settingArrays[indexPath.row];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = SUB_CONTENT_COLOR;
        if (indexPath.row == self.settingArrays.count - 1) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2lfMB",@"0.00MB"];
        }else{
            cell.detailTextLabel.text = @"";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if(indexPath.section == 1){
        cell.backgroundColor = BACKGROUND_COLOR;
        int padding = 10;
        CGRect mainF = self.view.bounds;
        UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        logoutBtn.frame = CGRectMake(padding*2, 0, mainF.size.width-padding*4, 44);
        logoutBtn.layer.masksToBounds = YES;
        logoutBtn.layer.cornerRadius = 22;
        [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        logoutBtn.backgroundColor = PRIMARY_COLOR;
        [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutBtn setTitleColor:UIColorFromRGBWithAlpha(0xffffff, 0.4) forState:UIControlStateHighlighted];
        [logoutBtn addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:logoutBtn];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0://接收推送
        {
        
        }
            break;
        case 1://一意见反馈
        {
            
        }
            break;
        case 2://关于
        {
            AboutViewController *aboutController = [[AboutViewController alloc]init];
            [self pushController:aboutController];
        }
            break;
        case 3://清除缓存
        {
            
        }
            break;
            
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = BACKGROUND_COLOR;
    return view;
}

-(void)logoutClicked:(UIButton *)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"您确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popToRootViewControllerAnimated:YES];
        LoginViewController *loginController = [[LoginViewController alloc]init];
        [UIApplication sharedApplication].delegate.window.rootViewController = loginController;
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark 懒加载
-(NSMutableArray *)settingArrays{
    if (_settingArrays == nil) {
        _settingArrays = @[@"接收推送",@"意见反馈",@"关于",@"清除缓存"].mutableCopy;
    }
    return _settingArrays;
}

@end
