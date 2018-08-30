//
//  UIView+Snapshot.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/7/11.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//  YYKit + yyadd 抽出

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)

/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)snapshotImage;

@end
