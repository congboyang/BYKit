//
//  BaseNavigationVC.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/19.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCustomVC.h"

@interface BaseNavigationVC : UINavigationController

/**
 Get the BaseCustomNavigationController with the root BaseCustomViewController.
 使用根BaseCustomViewController获取BaseCustomNavigationController。
 
 @param rootViewController The root BaseCustomViewController.
 @param hidden Hidden or not.
 @return BaseCustomNavigationController object.
 */
- (instancetype)initWithRootViewController:(BaseCustomVC *)rootViewController
                    setNavigationBarHidden:(BOOL)hidden;

@end
