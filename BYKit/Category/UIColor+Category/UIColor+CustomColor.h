//
//  UIColor+CustomColor.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义字符串转换颜色，失败后的返回默认颜色
#define DEFAULT_VOID_COLOR [UIColor blackColor]

@interface UIColor (CustomColor)

/** 从NSString转化成UIColor (#开头，16进制数转换) */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString alpha:(float)alph;

/** rgb 数值转化成颜色, red, green, blue在0--255之间 */
+ (UIColor *)colorWithRGB:(NSInteger)red
                 ForGreen:(NSInteger)green
                  ForBlue:(NSInteger)blue;
@end
