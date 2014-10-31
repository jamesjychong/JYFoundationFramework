//
//  UIColor+Initializer.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIColor+Initializer.h"
#import "JYFoundationConstant.h"

static double ColorConversionMultiply = 1 / 0xFF;

@implementation UIColor (Initializer)

+ (UIColor *)colorWithRawScaleRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
	return [self colorWithRawScaleRed:r green:g blue:b alpha:kByteMaxValue];
}

+ (UIColor *)colorWithRawScaleRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
	NSParameterAssert(kByteMinValue <= r && r <= kByteMaxValue);
	NSParameterAssert(kByteMinValue <= g && g <= kByteMaxValue);
	NSParameterAssert(kByteMinValue <= b && b <= kByteMaxValue);
	NSParameterAssert(kByteMinValue <= a && a <= kByteMaxValue);
	
	return [UIColor colorWithRed:r * ColorConversionMultiply green:g * ColorConversionMultiply
							blue:b * ColorConversionMultiply alpha:a * ColorConversionMultiply];
}

+ (UIColor *)colorWithRawScaleRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b percent:(CGFloat)p
{
	NSParameterAssert(kByteMinValue <= r && r <= kByteMaxValue);
	NSParameterAssert(kByteMinValue <= g && g <= kByteMaxValue);
	NSParameterAssert(kByteMinValue <= b && b <= kByteMaxValue);

	return [UIColor colorWithRed:r * ColorConversionMultiply green:g * ColorConversionMultiply
							blue:b * ColorConversionMultiply alpha:MIN(MAX(0, p), 1)];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
	// http://stackoverflow.com/questions/3805177/how-to-convert-hex-rgb-color-codes-to-uicolor
	
	NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
	if ([cleanString length] == 3)
	{
		cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
					   [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
					   [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
					   [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
	}
	if ([cleanString length] == 6)
	{
		cleanString = [cleanString stringByAppendingString:@"ff"];
	}
	
	unsigned int baseValue;
	[[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];

	float red   = ((baseValue >> 24) & 0xFF);
	float green = ((baseValue >> 16) & 0xFF);
	float blue  = ((baseValue >> 8)  & 0xFF);
	float alpha = ((baseValue >> 0)  & 0xFF);
	
	return [UIColor colorWithRawScaleRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorBlendWhite:(UIColor *)color withPercent:(CGFloat)percent
{
	CGFloat progress    = MIN(MAX(0, percent), 1);
	CGFloat progressInv = 1 - progress;
	
	CGFloat scaledR = 0, scaledG = 0, scaledB = 0, scaledA = 0;
	[color getRed:&scaledR green:&scaledG blue:&scaledB alpha:&scaledA];
	
	scaledR = (scaledR * progressInv) + progress;
	scaledG = (scaledG * progressInv) + progress;
	scaledB = (scaledB * progressInv) + progress;
	
	return [UIColor colorWithRed:scaledR green:scaledG blue:scaledB alpha:scaledA];
}

@end
