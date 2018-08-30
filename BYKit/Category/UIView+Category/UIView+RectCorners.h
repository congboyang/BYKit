//
//  UIView+RectCorners.h
//  CUTTT
//
//  Created by congboyang on 2018/8/28.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RectCorners)

- (void)addAllRectCorners;

- (void)addRectCorner:(UIRectCorner)corners;

- (void)addRectCorner:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;

@end
