//
//  UIImage+BYTool.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BYTool)

+(NSArray*)cutToGridWithImage:(UIImage *)image perCount:(NSInteger)count;

+(NSArray*)cutToRectWithImage:(UIImage *)image col:(NSInteger)col row:(NSInteger)row;

/**
 截取长图
 
 @param scrollView 继承自scrollview的视图
 */
+ (void)saveLongImage:(UIScrollView *)scrollView;

+ (UIImage *)addSlaveImage:(UIImage *)slaveImage toMasterImage:(UIImage *)masterImage;

+ (UIImage *)saveLongImageWithAssets:(NSArray<UIImage*>*)images;

+ (UIImage *)saveLongImageWithAssets:(NSArray<UIImage*>*)images space:(CGFloat)space;

+ (UIImage *)addWatermarkWithImage:(UIImage *)targetImage;
@end
