//
//  MineService.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/11.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "MineService.h"

@implementation MineService

-(id)initWithDelegate:(id<MineDelegate>) delegate{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

-(void)shareInitData{
    APIRequest *api = [[APIRequest alloc]initWithTag:@"initMineData"];
    api.urlAction = url_request_type_login;
    api.methodType = APIRequestMethodTypeGet;
    [[APIClient shareInstance]executeWithApi:api success:^(APIRequest *api,APIResult *result){
        if (self.delegate && [self.delegate respondsToSelector:@selector(initDataSuccess:nickName:)]) {
            [self.delegate initDataSuccess:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg" nickName:@"heihei"];
        }
    } failed:^(APIRequest *api,NSError *error){
        if (self.delegate && [self.delegate respondsToSelector:@selector(initDataSuccess:nickName:)]) {
            [self.delegate initDataSuccess:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505125724436&di=13627ec04cf4979da4554f931bc6fe2e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fdc54564e9258d109eba3d035d058ccbf6d814df0.jpg" nickName:@"heihei"];
        }
    }];
}

@end
