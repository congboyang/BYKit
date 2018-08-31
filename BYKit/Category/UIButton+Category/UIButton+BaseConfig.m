//
//  UIButton+BaseConfig.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/7/13.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "UIButton+BaseConfig.h"
#import "UIColor+CustomColor.h"

@implementation UIButton (BaseConfig)

-(void)configWithTitle:(NSString *)title titleColor:(NSString *)colorString font:(UIFont *)font
{
    [self setTitle:title?:@"" forState:UIControlStateNormal];
    [self setTitle:title?:@"" forState:UIControlStateHighlighted];
    [self setTitleColor:colorString?[UIColor colorFromHexRGB:colorString]:UIColor.blackColor forState:UIControlStateNormal];
    [self setTitleColor:colorString?[UIColor colorFromHexRGB:colorString]:UIColor.blackColor forState:UIControlStateHighlighted];
    [self.titleLabel setFont:font?:[UIFont systemFontOfSize:14]];
}

-(void)configWithTitle:(NSString *)title titleColor:(NSString *)colorString font:(UIFont *)font conerRadius:(CGFloat)radius borderColorString:(NSString *)borderColorString borderWidth:(CGFloat)borderWidth
{
    [self configWithTitle:title titleColor:colorString font:font];
    
    if(radius) self.layer.cornerRadius = radius;
    if(borderColorString) self.layer.borderColor = [UIColor colorFromHexRGB:borderColorString].CGColor;
    if(borderWidth) self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

@end
