//
//  ShowLoadingView.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/19.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "ShowLoadingView.h"

@interface ShowLoadingView ()

@property (nonatomic) NSInteger count;

@end

@implementation ShowLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.count = 0;
}

- (void)push {
    
    self.count += 1;
}

- (void)pop {
    
    self.count -= 1;
}

@synthesize count = _count;
- (void)setCount:(NSInteger)count {
    
    _count = count;
    if (_count >= 1) {
        
        self.userInteractionEnabled = YES;
        
    } else {
        
        self.userInteractionEnabled = NO;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
