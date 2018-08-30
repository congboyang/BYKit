//
//  CellHeaderFooterDataAdapter.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/25.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "CellHeaderFooterDataAdapter.h"

@implementation CellHeaderFooterDataAdapter

+ (instancetype)cellHeaderFooterDataAdapterWithReuseIdentifier:(NSString *)reuseIdentifier
                                                          data:(id)data
                                                        height:(CGFloat)height
                                                          type:(NSInteger)type {
    
    CellHeaderFooterDataAdapter *adapter = [[self class] new];
    adapter.reuseIdentifier              = reuseIdentifier;
    adapter.data                         = data;
    adapter.height                       = height;
    adapter.type                         = type;
    
    return adapter;
}

@end
