//
//  MarocDefine.h
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/27.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#ifndef MarocDefine_h
#define MarocDefine_h

#define singletonH(className) + (className *) shared##className;
#define singletonM(className) static id _instance = nil;\
+(className *)shared##className\
{\
    return [[className alloc] init];\
}\
\
-(instancetype)init\
{\
    if (_instance) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super init];\
        });\
    }\
    \
    return _instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    if (_instance == nil) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    \
    return _instance;\
}

#define kBasekeyFeedbackEmail @"cuttt1@163.com"
#define kBaseKeyAppversion @"Appversion"


#define MaxWaveCrest 20.f
#define TitleWHRate (CGFloat)(179.f/75.f);


#endif /* MarocDefine_h */
