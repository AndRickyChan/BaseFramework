//
//  ShopCell.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/15.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "ShopCell.h"

@implementation ShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"shopCellID";
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int padding = 16;
        
        _shopIconView = [[UIImageView alloc]init];
        _shopIconView.backgroundColor = PRIMARY_COLOR;
        _shopIconView.layer.masksToBounds = YES;
        _shopIconView.layer.cornerRadius = 4;
        [self.contentView addSubview:_shopIconView];
        [_shopIconView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.contentView.left).offset(padding);
            make.top.equalTo(self.contentView.top).offset(padding);
            make.size.equalTo(CGSizeMake(78, 78));
            make.bottom.equalTo(self.contentView.bottom).offset(-padding);
        }];
        
        _shopTypeView = [[UILabel alloc]init];
        _shopTypeView.font = [UIFont systemFontOfSize:12];
        _shopTypeView.textColor = PRIMARY_COLOR;
        _shopTypeView.text = @"土家特色菜";
        [self.contentView addSubview:_shopTypeView];
        [_shopTypeView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_shopIconView.right).offset(padding);
            make.centerY.equalTo(_shopIconView.centerY);
        }];
        
        _averagePriceView = [[UILabel alloc]init];
        _averagePriceView.font = [UIFont systemFontOfSize:12];
        _averagePriceView.textColor = ACCENT_COLOR;
        _averagePriceView.text = @"￥120/人";
        [self.contentView addSubview:_averagePriceView];
        [_averagePriceView mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(self.contentView.right).offset(-padding);
            make.centerY.equalTo(_shopIconView.centerY);
        }];
        
        _shopNameView = [[UILabel alloc]init];
        _shopNameView.font = [UIFont systemFontOfSize:13];
        _shopNameView.textColor = TITLE_COLOR;
        _shopNameView.text = @"家家腊鱼馆";
        [self.contentView addSubview:_shopNameView];
        [_shopNameView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_shopIconView.right).offset(padding);
            make.bottom.equalTo(_shopTypeView.top).offset(-padding/2);
        }];
        
        _shopAddressView = [[UILabel alloc]init];
        _shopAddressView.font = [UIFont systemFontOfSize:12];
        _shopAddressView.textColor = CONTENT_COLOR;
        _shopAddressView.text = @"恩施市金桂大道新天地";
        _shopAddressView.numberOfLines = 1;
        [self.contentView addSubview:_shopAddressView];
        [_shopAddressView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_shopIconView.right).offset(padding);
            make.right.equalTo(self.contentView.right).offset(-padding);
            make.top.equalTo(_shopTypeView.bottom).offset(padding/2);
        }];
    }
    return self;
}

-(void)setModelForShop:(ShopModel *)model{
    [_shopIconView sd_setImageWithURL:[NSURL URLWithString:model.shopIconStr]];
    _shopNameView.text = model.shopNameStr;
    _shopTypeView.text = model.shopTypeStr;
    _averagePriceView.text = [NSString stringWithFormat:@"￥%@元/人",model.averagePriceStr];
    _shopAddressView.text = model.shopAddressStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
