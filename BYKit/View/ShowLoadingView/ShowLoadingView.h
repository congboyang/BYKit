//
//  ShowLoadingView.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/19.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowLoadingView : UIView

@property (nonatomic, readonly) NSInteger count;

- (void)push;

- (void)pop;

@end
