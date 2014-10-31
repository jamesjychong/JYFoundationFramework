//
//  UIView+Draw.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 8/20/13

#import "UIView+Draw.h"

@implementation UIView (Draw)

+ (void)drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors
{
	NSMutableArray *ar = [NSMutableArray array];
	for (UIColor *color in colors) [ar addObject:(id)color.CGColor];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ar, NULL);
	
	CGContextClipToRect(context, rect);
	
	CGPoint start = CGPointMake(0.0, 0.0);
	CGPoint end = CGPointMake(0.0, rect.size.height);
	
	CGContextDrawLinearGradient(context, gradient, start, end, (kCGGradientDrawsBeforeStartLocation |
																kCGGradientDrawsAfterEndLocation));
	
	CGGradientRelease(gradient);
	CGContextRestoreGState(context);
}

@end
