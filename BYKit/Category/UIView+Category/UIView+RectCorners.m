//
//  UIView+RectCorners.m
//  CUTTT
//
//  Created by congboyang on 2018/8/28.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "UIView+RectCorners.h"

@implementation UIView (RectCorners)

-(void)addAllRectCorners
{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    byRoundingCorners:UIRectCornerAllCorners
                                                          cornerRadii:CGSizeMake(self.frame.size.width/2.f, self.frame.size.height/2.f)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = self.bounds;
    self.layer.mask = maskLayer;
}

-(void)addRectCorner:(UIRectCorner)corners
{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    byRoundingCorners:corners
                                                          cornerRadii:CGSizeMake(self.frame.size.width/2.f, self.frame.size.height/2.f)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = self.bounds;
    self.layer.mask = maskLayer;
}

-(void)addRectCorner:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    byRoundingCorners:corners
                                                          cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = self.bounds;
    self.layer.mask = maskLayer;
}

@end
