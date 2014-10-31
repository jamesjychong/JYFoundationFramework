//
//  UIView+Subview.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 8/21/13

#import "UIView+Subview.h"

@implementation UIView (Subview)

+ (void)setAlpha:(CGFloat)alpha inViewList:(NSArray *)subviews
{
	for (id element in subviews)
	{
		if ([element isKindOfClass:[UIView class]])
		{
			UIView *subview = element;
			subview.alpha = alpha;
		}
	}
}

- (void)setSubviewAlpha:(CGFloat)alpha
{
	for (UIView *subview in self.subviews)
		subview.alpha = alpha;
}

- (void)addSubviewToBack:(UIView *)view
{
	[self insertSubview:view atIndex:0];
}

- (void)removeAllSubviews
{
	[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
