//
//  AddressViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/12.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressView.h"

@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AddressView *_addressView;
}

@property(nonatomic,strong)NSMutableArray *addressArrays;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的地址";
    _addressView = [[AddressView alloc]initWithFrame:NAVIGATION_RECT];
    [self.view addSubview:_addressView];
    _addressView.tableView.dataSource = self;
    _addressView.tableView.delegate = self;
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
        return 0;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return nil;
    }else{
        static NSString *identifier = @"addAddressCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textColor = TITLE_COLOR;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = @"新增地址";
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        if (self.addressArrays == nil) {
            return 0;
        }else{
            return 12;
        }
    }else{
        return 12;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = BACKGROUND_COLOR;
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
