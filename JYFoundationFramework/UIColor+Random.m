//
//  UIColor+Random.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor
{
	return [UIColor colorWithHue:arc4random()/((float)0x100000000) saturation:0.75 brightness:1.0 alpha:1.0];
}

@end
