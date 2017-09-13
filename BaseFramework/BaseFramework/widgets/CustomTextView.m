//
//  CustomTextView.m
//  BaseFramework
//
//  Created by rickychan on 2017/9/12.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#import "CustomTextView.h"

@interface CustomTextView()

@property(nonatomic,weak)UILabel *placeholderLabel;

@end

@implementation CustomTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UILabel *placeholderLabel = [[UILabel alloc]init];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0;
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        self.placeholderColor = [UIColor lightGrayColor];
        self.font = [UIFont systemFontOfSize:15];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

-(void)textDidChange{
    self.placeholderLabel.hidden = self.hasText;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    int labelWidth = self.frame.size.width-5*2;
    CGSize maxSize = CGSizeMake(labelWidth, MAXFLOAT);
    
    CGSize realSize = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.placeholderLabel.font} context:nil].size;
    
    self.placeholderLabel.frame = CGRectMake(5, 8, labelWidth,realSize.height);
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = [placeholder copy];
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font = font;
    [self setNeedsLayout];
}

-(void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}

-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
}


@end
