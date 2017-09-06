//
//  BaseViewController.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)showProgress;

-(void)hideProgress;

-(void)showToast:(NSString *)message;

-(void)pushController:(UIViewController *)viewController;

-(void)popController;

@end
