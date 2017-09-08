//
//  AboutViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/8.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutView.h"
#import "AppUtils.h"

@interface AboutViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AboutView *_aboutView;
}

@property(nonatomic,strong)NSMutableArray *aboutArrays;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"关于";
    _aboutView = [[AboutView alloc]initWithFrame:NAVIGATION_RECT];
    [self.view addSubview:_aboutView];
    _aboutView.tableView.delegate = self;
    _aboutView.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aboutArrays.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"aboutCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = CONTENT_COLOR;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = SUB_CONTENT_COLOR;
    }
    cell.textLabel.text = self.aboutArrays[indexPath.row];
    if (indexPath.row ==0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Version %@",[AppUtils getAppVersion]];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(NSMutableArray *)aboutArrays{
    if (_aboutArrays == nil) {
        _aboutArrays = @[@"检查更新",@"推荐给好友"].mutableCopy;
    }
    return _aboutArrays;
}

@end
