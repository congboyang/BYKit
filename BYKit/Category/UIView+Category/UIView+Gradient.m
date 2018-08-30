//
//  UIView+Gradient.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "UIView+Gradient.h"
#import "UIColor+CustomColor.h"
#import <objc/runtime.h>

static const char kGradientLayerContext[] = "kGradientLayerContext";

@implementation UIView (Gradient)

- (void)addGradient
{
    NSArray *colors = @[[UIColor colorFromHexRGB:@"FF9684"],[UIColor colorFromHexRGB:@"FF5E49"]];
    [self addGradientWithColor:colors];
}

- (void)addGradientWithColor:(NSArray *)colors
{
    CGPoint points[2] = {{0,1},{1,1}};
    [self addGradientWithColor:colors points:points];
}

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points
{
    if (!colors && colors.count < 2) {
        colors = @[[UIColor colorFromHexRGB:@"FF9684"],[UIColor colorFromHexRGB:@"FF5E49"]];
    }
    NSArray *locations = @[@0.f,@1.f];
    [self addGradientWithColor:colors points:points locations:locations];
}

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points locations:(NSArray*)locations
{
    CAGradientLayer *gradientLayer = objc_getAssociatedObject( self, kGradientLayerContext );
    if (!gradientLayer) {
        gradientLayer = [CAGradientLayer layer];
        [self.layer insertSublayer:gradientLayer atIndex:0];
    }
    gradientLayer.colors = [self convertValue:colors];
    gradientLayer.locations = locations;
    gradientLayer.startPoint = *points;
    gradientLayer.endPoint = *(points+1);
    gradientLayer.frame = self.bounds;
//    [gradientLayer removeAllAnimations];
    [gradientLayer displayIfNeeded];
    objc_setAssociatedObject( self, kGradientLayerContext, gradientLayer, OBJC_ASSOCIATION_RETAIN);
}

-(void)addGradientWithFrame:(CGRect)frame
{
    NSArray *colors = @[[UIColor colorFromHexRGB:@"FF9684"],[UIColor colorFromHexRGB:@"FF5E49"]];
    [self addGradientWithColor:colors frame:frame];
}

-(void)addGradientWithColor:(NSArray *)colors frame:(CGRect)frame
{
    CGPoint points[2] = {{0,1},{1,1}};
    [self addGradientWithColor:colors points:points frame:frame];
}

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points frame:(CGRect)frame
{
    NSArray *locations = @[@0.f,@1.f];
    [self addGradientWithColor:colors points:points locations:locations frame:frame];
}

- (void)addGradientWithColor:(NSArray *)colors points:(CGPoint *)points locations:(NSArray*)locations frame:(CGRect)frame
{
    CAGradientLayer *gradientLayer = objc_getAssociatedObject( self, kGradientLayerContext );
    if (!gradientLayer) {
        gradientLayer = [CAGradientLayer layer];
        [self.layer insertSublayer:gradientLayer atIndex:0];
    }
    gradientLayer.colors = [self convertValue:colors];
    gradientLayer.locations = locations;
    gradientLayer.startPoint = *points;
    gradientLayer.endPoint = *(points+1);
    gradientLayer.frame = frame;
    [gradientLayer removeAllAnimations];
    [gradientLayer displayIfNeeded];
    objc_setAssociatedObject( self, kGradientLayerContext, gradientLayer, OBJC_ASSOCIATION_RETAIN);
}

//util
- (NSArray *)convertValue:(NSArray *)target
{
    NSMutableArray *res = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i< target.count; i++) {
        if ([[target[i] description] hasPrefix:@"<CGColor"]) {
            [res addObject:(id)target[i]];
        }else if([target[i] isKindOfClass:[UIColor class]]){
            [res addObject:(id)((UIColor*)target[i]).CGColor];
        }else{
            [[NSException exceptionWithName:@"渐变色配置" reason:@"颜色配置错误" userInfo:@{@"value":target}] raise];
        }
    }
    return res;
}

-(void)updateGradientFrame:(CGRect)frame
{
    CAGradientLayer *gradientLayer = objc_getAssociatedObject( self, kGradientLayerContext);
    gradientLayer.frame = frame;
}

- (void)removeGradient
{
    CAGradientLayer *gradientLayer = objc_getAssociatedObject( self, kGradientLayerContext);
    [gradientLayer removeFromSuperlayer];
}

@end
