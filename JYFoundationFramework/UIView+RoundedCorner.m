//
//  UIView+RoundedCorner.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/23/13

#import "UIView+RoundedCorner.h"

#define kDefaultViewCornerRadius (5.0f)

@implementation UIView (RoundedCorner)

- (void)addRoundedCorners
{
	[self addRoundedCornersWithRadius:kDefaultViewCornerRadius];
}

- (void)addRoundedCornersWithRadius:(CGFloat)cornerRadiusInPixels
{
    self.layer.cornerRadius = cornerRadiusInPixels;
    self.layer.masksToBounds = YES;
}

- (void)makeEndsRounded
{
    CGFloat minSide = fmin(self.bounds.size.width, self.bounds.size.height);
    [self addRoundedCornersWithRadius:minSide/2];
}

@end
