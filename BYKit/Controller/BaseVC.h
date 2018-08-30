//
//  BaseVC.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/19.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseVC;

@protocol CustomViewControllerDelegate <NSObject>

@optional

/**
 *  The BaseVC's event.
 *  BaseVC的事件
 *
 *  @param controller Kind of BaseCustomViewController.
 *  @param event The event.
 */
- (void)baseCustomViewController:(__kindof BaseVC *)controller event:(id)event;

@end

@interface BaseVC : UIViewController

/**
 *  The BaseCustomViewController's delegate.
 */
@property (nonatomic, weak) id <CustomViewControllerDelegate> eventDelegate;

/**
 *  You can only use this method when the current controller is an UINavigationController's rootViewController.
 *  当前控制器是UINavigationController的rootViewController时，只能使用此方法
 */
- (void)useInteractivePopGestureRecognizer;

/**
 *  You can use this property when this controller is pushed by an UINavigationController.
 *  当此控制器被UINavigationController push时，您可以使用此属性
 */
@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop.
 *  如果此控制器由UINavigationController管理，则可以使用此方法弹出
 *
 *  @param animated Animated or not.
 */
- (void)popViewControllerAnimated:(BOOL)animated;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
 *  如果此控制器由UINavigationController管理，则可以使用此方法弹出到rootViewController
 *
 *  @param animated Animated or not.
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated;

@end
