//
//  UIView+Gradient.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points locations:(NSArray*)locations;
- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points;
- (void)addGradientWithColor:(NSArray *)colors;
- (void)addGradient;

#pragma mark - masonry 使用方法

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points locations:(NSArray*)locations frame:(CGRect)frame;
- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points frame:(CGRect)frame;
- (void)addGradientWithColor:(NSArray *)colors frame:(CGRect)frame;
- (void)addGradientWithFrame:(CGRect)frame;
- (void)updateGradientFrame:(CGRect)frame;
- (void)removeGradient;

@end
