//
//  CustomPickerView.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/12.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedTitle)(NSString *selectedTitle);

@interface CustomPickerView : UIView

@property(nonatomic,strong)NSMutableArray *dataArrays;

-(instancetype)initWithTitle:(NSString *)title block:(selectedTitle)selectedBlock;

-(void)show;
@end
