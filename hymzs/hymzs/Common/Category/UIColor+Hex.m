//
//  UIColor+Hex.m
//  QunChangMob
//
//  Created by qiangli on 15/5/20.
//  Copyright (c) 2015年 dooban. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (instancetype)colorWithHex:(NSUInteger)hex
{
    return [self colorWithHex:hex alpha:1.];
}

+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha
{
    NSInteger blue = hex & 0xff;
    NSInteger green = hex >> 8 & 0xff;
    NSInteger red = hex >> 16 & 0xff;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

@end
