//
//  UIView+AutoLayout.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 9/5/13

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

- (void)constraintForWidth:(CGFloat)width
{
	NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
																  attribute:NSLayoutAttributeWidth
																  relatedBy:NSLayoutRelationEqual
																	 toItem:nil
																  attribute:NSLayoutAttributeNotAnAttribute
																 multiplier:1.0f
																   constant:width];
	[self addConstraint:constraint];
}

- (void)constraintForHeight:(CGFloat)height
{
	NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
																  attribute:NSLayoutAttributeHeight
																  relatedBy:NSLayoutRelationEqual
																	 toItem:nil
																  attribute:NSLayoutAttributeNotAnAttribute
																 multiplier:1.0f
																   constant:height];
	[self addConstraint:constraint];
}

+ (void)removeDimensionConstraintsForView:(UIView *)view
{
	[self removeConstraintsForView:view shouldDeleteDimension:YES];
}

+ (void)removeAllExceptDimensionConstraintsForView:(UIView *)view
{
	[self removeConstraintsForView:view shouldDeleteDimension:NO];
}

+ (void)removeConstraintsForView:(UIView *)view shouldDeleteDimension:(BOOL)deleteDimension
{
	for (id constraint in view.constraints)
	{
		if (![constraint isKindOfClass:[NSLayoutConstraint class]])
			continue;
		NSLayoutConstraint *layoutConstraint = constraint;
		
		BOOL isView   = layoutConstraint.firstItem == view;
		BOOL isHeight = layoutConstraint.firstAttribute == NSLayoutAttributeHeight;
		BOOL isWidth  = layoutConstraint.firstAttribute == NSLayoutAttributeWidth;
		BOOL isDimensionCase = isView && (isHeight || isWidth);
		
		if ((deleteDimension && isDimensionCase) || (!deleteDimension && !isDimensionCase))
			[view removeConstraint:layoutConstraint];
	}
}

@end
