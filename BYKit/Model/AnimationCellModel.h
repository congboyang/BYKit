//
//  AnimationCellModel.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/25.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationCellModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id        object;
@property (nonatomic)                   NSInteger index;

+ (instancetype)itemWithObject:(id)object name:(NSString *)name;

@property (nonatomic, strong, readonly) NSMutableAttributedString *nameString;

@end
