//
//  AnimationCellModel.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/25.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "AnimationCellModel.h"
#import "UIFont+Fonts.h"
#import "AttributedStringConfigHelper.h"

@interface AnimationCellModel ()

@property (nonatomic, strong) NSMutableAttributedString *nameString;

@end

@implementation AnimationCellModel

+ (instancetype)itemWithObject:(id)object name:(NSString *)name {
    
    AnimationCellModel *item  = [[[self class] alloc] init];
    item.name   = name;
    item.object = object;
    
    return item;
}

- (NSMutableAttributedString *)nameString {
    
    if (_nameString == nil) {
        
        NSString *fullStirng = [NSString stringWithFormat:@"%02ld. %@", (long)self.index, self.name];
        
        NSMutableAttributedString *richString = [NSMutableAttributedString mutableAttributedStringWithString:fullStirng config:^(NSString *string, NSMutableArray<AttributedStringConfig *> *configs) {
            
            [configs addObject:[FontAttributeConfig configWithFont:[UIFont HeitiSCWithFontSize:16.f] range:NSMakeRange(0, string.length)]];
            [configs addObject:[FontAttributeConfig configWithFont:[UIFont fontWithName:@"GillSans-Italic" size:16.f] range:NSMakeRange(0, 3)]];
            [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.65f] range:NSMakeRange(0, string.length)]];
            [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor redColor] colorWithAlphaComponent:0.65f] range:NSMakeRange(0, 3)]];
        }];
        
        _nameString = richString;
    }
    
    return _nameString;
}
@end
