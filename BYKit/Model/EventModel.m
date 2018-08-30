//
//  EventModel.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/7/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "EventModel.h"

@implementation EventModel

+(instancetype)eventWithName:(NSString *)name
{
    EventModel * model =  [[EventModel alloc] init];
    model.name = name;
    
    return model;
}

+(instancetype)eventWithName:(NSString *)name data:(id)data
{
    EventModel * model = [EventModel eventWithName:name];
    model.data = data;
    
    return model;
}

@end
