//
//  UserInfoViewController.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/11.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoView.h"
#import "AddressViewController.h"
#import "CustomPickerView.h"
#import <RSKImageCropper/RSKImageCropper.h>

@interface UserInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,RSKImageCropViewControllerDelegate>
{
    UserInfoView *_userInfoView;
    NSString *_userHeaderStr;
    NSString *_userSexStr;
    NSString *_userAgeStr;
    NSString *_userBirthdayStr;
    
}

@property(nonatomic,strong)NSMutableArray *infoArrays;

@property(nonatomic,strong)UIImagePickerController *pickerController;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人信息";
    _userInfoView = [[UserInfoView alloc]initWithFrame:NAVIGATION_RECT];
    [self.view addSubview:_userInfoView];
    _userInfoView.tableView.delegate = self;
    _userInfoView.tableView.dataSource = self;
    _userSexStr = @"未知";
    _userAgeStr = @"12岁";
    _userBirthdayStr = @"05-25";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *itemArray = self.infoArrays[section];
    return itemArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 78;
    }else{
        return 42;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 12;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = BACKGROUND_COLOR;
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"userInfoCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = TITLE_COLOR;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = CONTENT_COLOR;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        //头像
        UIImageView *headerView = [[UIImageView alloc]init];
        headerView.layer.masksToBounds = YES;
        headerView.layer.cornerRadius = 6;
        [cell.contentView addSubview:headerView];
        [headerView mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(cell.contentView.centerY);
            make.right.equalTo(cell.contentView.right);
            make.size.equalTo(CGSizeMake(66, 66));
        }];
        [headerView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg"]];
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {//性别
            cell.detailTextLabel.text = _userSexStr;
        }else if(indexPath.row == 1){//年龄
            cell.detailTextLabel.text = _userAgeStr;
        }else if(indexPath.row == 2){//生日
            cell.detailTextLabel.text = _userBirthdayStr;
        }
    }else{
        //收货地址
        
    }
    NSArray *itemArray = self.infoArrays[indexPath.section];
    cell.textLabel.text = itemArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {//头像
        [self showCameraSheet];
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            [self showSexSheet];
        }else if(indexPath.row == 1){
            //年龄
            CustomPickerView *pickerView = [[CustomPickerView alloc]initWithTitle:@"选择年龄" block:^(NSString *data){
                _userAgeStr = [NSString stringWithFormat:@"%@岁",data];
                [_userInfoView.tableView reloadData];
            }];
            pickerView.dataArrays = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"].mutableCopy;
            [pickerView show];
        }
    }else{//选择收货地址
        AddressViewController *controller = [[AddressViewController alloc]init];
        [self pushController:controller];
    }
}

#pragma mark UIImagePickerController Delegate 

//完成照片选择之后的回到方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    /* 此处参数 info 是一个字典，下面是字典中的键值 （从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     * UIImagePickerControllerMediaType;      // 媒体类型
     * UIImagePickerControllerOriginalImage;  // 原始图片
     * UIImagePickerControllerEditedImage;    // 裁剪后图片
     * UIImagePickerControllerCropRect;       // 图片裁剪区域（CGRect）
     * UIImagePickerControllerMediaURL;       // 媒体的URL
     * UIImagePickerControllerReferenceURL    // 原件的URL
     * UIImagePickerControllerMediaMetadata   // 当数据来源是相机时，此值才有效
     */
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    RSKImageCropViewController *cropperController = [[RSKImageCropViewController alloc]initWithImage:image];
    cropperController.delegate = self;
//    cropperController.dataSource = self;
    [self pushController:cropperController];
    //调用完成之后关闭图片选择或者拍照界面
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    //调用完成之后关闭图片选择或者拍照界面
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark cropperImage delegate

-(void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller{
    [self popController];
}

-(void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect{
    NSLog(@"裁剪图片成功...");
    [self popController];
}


#pragma mark some method begin

-(void)showCameraSheet{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    controller.view.tintColor = TITLE_COLOR;
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.pickerController animated:YES completion:nil];
    }];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.pickerController animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){//判断设备是否支持相机
        [controller addAction:cameraAction];
    }
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        [controller addAction:albumAction];
    }
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)showSexSheet{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    controller.view.tintColor = TITLE_COLOR;
    UIAlertAction *menAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _userSexStr = @"男";
        [_userInfoView.tableView reloadData];
    }];
    UIAlertAction *femenAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _userSexStr = @"女";
        [_userInfoView.tableView reloadData];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [controller addAction:menAction];
    [controller addAction:femenAction];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}


-(NSMutableArray *)infoArrays{
    if (_infoArrays == nil) {
        _infoArrays = @[@[@"头像"],@[@"性别",@"年龄",@"生日"],@[@"收货地址"]].mutableCopy;
    }
    return _infoArrays;
}

-(UIImagePickerController *)pickerController{
    if (_pickerController == nil) {
        _pickerController = [[UIImagePickerController alloc]init];
        _pickerController.allowsEditing = NO;
        _pickerController.delegate = self;
    }
    return _pickerController;
}

@end
