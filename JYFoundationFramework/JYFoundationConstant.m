//
//  JYFoundationConstant.m
//  JYFoundationFramework
//
//  Created by James Chong on 10/20/14.
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "JYFoundationConstant.h"

const Byte kByteMinValue = 0;
const Byte kByteMaxValue = 0xFF;


@implementation JYFoundationConstant

+ (UIViewAutoresizing)viewAutoresizingMaskSetAll
{
	return ([self viewAutoresizingMaskSetAllMargin] | [self viewAutoresizingMaskSetAllSize]);
}

+ (UIViewAutoresizing)viewAutoresizingMaskSetAllMargin
{
	return (UIViewAutoresizingFlexibleTopMargin  | UIViewAutoresizingFlexibleBottomMargin |
			UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
}

+ (UIViewAutoresizing)viewAutoresizingMaskSetAllSize
{
	return (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
}

@end
