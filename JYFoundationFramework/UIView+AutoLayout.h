//
//  UIView+AutoLayout.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 9/5/13

@interface UIView (AutoLayout)

- (void)constraintForWidth:(CGFloat)width;
- (void)constraintForHeight:(CGFloat)height;

+ (void)removeDimensionConstraintsForView:(UIView *)view;
+ (void)removeAllExceptDimensionConstraintsForView:(UIView *)view;

@end
