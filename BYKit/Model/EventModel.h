//
//  EventModel.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/7/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

@property(nonatomic,copy) NSString * name;
@property(nonatomic,strong) id data;

+ (instancetype)eventWithName:(NSString *)name;

+ (instancetype)eventWithName:(NSString *)name data:(id)data;

@end
