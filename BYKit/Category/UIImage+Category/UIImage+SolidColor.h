//
//  UIImage+SolidColor.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SolidColor)

/**
 *  Create a solid color image.
 *
 *  @param size  The image size.
 *  @param color The image color.
 *
 *  @return Image.
 */
+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color;

@end
