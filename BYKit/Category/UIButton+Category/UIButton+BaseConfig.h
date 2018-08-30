//
//  UIButton+BaseConfig.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/7/13.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BaseConfig)

- (void)configWithTitle:(NSString *)title titleColor:(NSString *)colorString font:(UIFont *)font;

- (void)configWithTitle:(NSString *)title titleColor:(NSString *)colorString font:(UIFont *)font conerRadius:(CGFloat)radius borderColorString:(NSString *)borderColorString borderWidth:(CGFloat)borderWidth;

@end
