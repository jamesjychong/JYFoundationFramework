//
//  UIColor+Initializer.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UIColor (Initializer)

+ (UIColor *)colorWithRawScaleRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWithRawScaleRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRawScaleRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue percent:(CGFloat)percent;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorBlendWhite:(UIColor *)color withPercent:(CGFloat)percent;

@end
