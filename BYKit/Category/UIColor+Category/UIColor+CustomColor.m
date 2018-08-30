//
//  UIColor+CustomColor.m
//  CongBoYangShow
//
//  Created by congboyang on 2018/6/26.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "UIColor+CustomColor.h"

@implementation UIColor (CustomColor)

+ (UIColor *)colorFromHexRGB:(NSString *)inColorString {
    if(!inColorString) return DEFAULT_VOID_COLOR;
    NSString *cString = [[inColorString
                          stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"])
            cString = [cString substringFromIndex:1];
            if ([cString length] < 6)
                return DEFAULT_VOID_COLOR;
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte, alpha;
    
    if (nil != cString) {
        NSScanner *scanner = [NSScanner scannerWithString:cString];
        (void)[scanner scanHexInt:&colorCode]; // ignore error
    }
    if ([cString length] > 6) {
        alpha = (unsigned char)(colorCode >> 24);
    }else{
        alpha = 255.0;
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    //    NSLog(@"%@=(%d,%d,%d)",inColorString,redByte,greenByte,blueByte);
    result = [UIColor colorWithRed:(float)redByte / 255.0f
                             green:(float)greenByte / 255.0f
                              blue:(float)blueByte / 255.0f
                             alpha:alpha/255.0];
    return result;
}
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString alpha:(float)alph{
    NSString *cString = [[inColorString
                          stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"])
            cString = [cString substringFromIndex:1];
            if ([cString length] != 6)
                return DEFAULT_VOID_COLOR;
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != cString) {
        NSScanner *scanner = [NSScanner scannerWithString:cString];
        (void)[scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    result = [UIColor colorWithRed:(float)redByte / 0xff
                             green:(float)greenByte / 0xff
                              blue:(float)blueByte / 0xff
                             alpha:alph];
    return result;
    
}

+ (UIColor *)colorWithRGB:(NSInteger)red
ForGreen:(NSInteger)green
ForBlue:(NSInteger)blue {
    return [UIColor colorWithRed:((float)red / 255.0f)
                           green:((float)green / 255.0f)
                            blue:((float)blue / 255.0f)
                           alpha:1.0f];
}
@end
