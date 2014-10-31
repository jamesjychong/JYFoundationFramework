//
//  UIView+RoundedCorner.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/23/13

@interface UIView (RoundedCorner)

- (void)addRoundedCorners;
- (void)addRoundedCornersWithRadius:(CGFloat)cornerRadiusInPixels;

- (void)makeEndsRounded;

@end
