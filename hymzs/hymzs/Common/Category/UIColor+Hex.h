//
//  UIColor+Hex.h
//  QunChangMob
//
//  Created by qiangli on 15/5/20.
//  Copyright (c) 2015年 dooban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (instancetype)colorWithHex:(NSUInteger)hex;

+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;
@end
