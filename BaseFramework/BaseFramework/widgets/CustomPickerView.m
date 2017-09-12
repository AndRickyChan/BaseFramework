//
//  CustomPickerView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/12.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "CustomPickerView.h"

#define VIEW_HEIGHT 220


@interface CustomPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation CustomPickerView
{
    UIView *_bgView;
    selectedTitle _selectBlock;
    NSString *_selectedData;
}

-(instancetype)initWithTitle:(NSString *)title block:(selectedTitle)selectedBlock{
    self =[super initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, VIEW_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //确定按钮
        UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        confirmButton.frame = CGRectMake(SCREEN_WIDTH-80, 0, 80, 50);
        [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [confirmButton setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
        [confirmButton setTitleColor:CONTENT_COLOR forState:UIControlStateHighlighted];
        [confirmButton addTarget:self action:@selector(confirmButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:confirmButton];
        //取消按钮
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(0, 0, 80, 50);
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
        [cancelButton setTitleColor:CONTENT_COLOR forState:UIControlStateHighlighted];
        [cancelButton addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelButton];
        //标题
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, SCREEN_WIDTH-160, 50)];
        titleLabel.text = title;
        titleLabel.textColor = PRIMARY_COLOR;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 1;
        [self addSubview:titleLabel];
        //pickerView
        UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, VIEW_HEIGHT-50)];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [self addSubview:pickerView];
    }
    //保存回调方法
    _selectBlock = selectedBlock;
    return self;
}

-(void)show{
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    _bgView = [[UIView alloc]initWithFrame:window.bounds];
    _bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    [window addSubview:_bgView];
    [_bgView addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT-VIEW_HEIGHT, SCREEN_WIDTH, VIEW_HEIGHT);
    }];
}

-(void)hiddenView{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, VIEW_HEIGHT);
    } completion:^(BOOL finished){
        [_bgView removeFromSuperview];
        _bgView = nil;
        [self removeFromSuperview];
    }];
}

//确定按钮点击事件
-(void)confirmButtonClicked:(UIButton *)sender{
    if (self.dataArrays.count == 0) {
        return;
    }
    if (!_selectedData) {
        _selectedData = self.dataArrays[0];
    }
    _selectBlock(_selectedData);
    //确定后要执行隐藏pickerview操作
    [self hiddenView];
}

#pragma mark pickerview delegate 

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArrays.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArrays[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _selectedData= self.dataArrays[row];
}

-(NSMutableArray *)dataArrays{
    if (_dataArrays == nil) {
        _dataArrays = @[].mutableCopy;
    }
    return _dataArrays;
}


@end
