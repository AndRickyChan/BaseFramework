//
//  BaseThemeMacro.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#ifndef BaseThemeMacro_h
#define BaseThemeMacro_h

//RGB转UIColor（不带alpha值）
#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB转UIColor（带alpha值）
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define PRIMARY_COLOR UIColorFromRGB(0xff4754)
#define BACKGROUND_COLOR UIColorFromRGB(0xf5f5f5)
#define TITLE_COLOR UIColorFromRGB(0x222222)
#define CONTENT_COLOR UIColorFromRGB(0x666666)
#define SUB_CONTENT_COLOR UIColorFromRGB(0x999999)
#define DIVIDER_COLOR UIColorFromRGB(0xeeeeee)
#define TIP_COLOR UIColorFromRGB(0xdddddd)


#endif /* BaseThemeMacro_h */
