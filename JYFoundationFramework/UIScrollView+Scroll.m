//
//  UIScrollView+Scroll.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import <objc/runtime.h>
#import "UIScrollView+Scroll.h"

static char* UIScrollViewSuppressScrollEvent;


@implementation UIScrollView (Scroll)


- (void)scrollToTop:(BOOL)animated
{
	CGFloat offsetY = [self minContentOffset];
//	offsetY = MIN(offsetY, [self maxContentOffset]);

	if (offsetY != self.contentOffset.y)
	{
		CGPoint contentTopOffset = CGPointMake(self.contentOffset.x, offsetY);
		[self setContentOffset:contentTopOffset animated:animated];
	}
}

- (void)scrollToBottom:(BOOL)animated
{
	CGFloat offsetY = [self maxContentOffset];
	offsetY = MAX(offsetY, [self minContentOffset]);

	if (offsetY != self.contentOffset.y)
	{
		CGPoint contentBottomOffset = CGPointMake(self.contentOffset.x, offsetY);
		[self setContentOffset:contentBottomOffset animated:animated];
	}
}

- (void)scrollToValidPosition:(BOOL)animated
{
	CGFloat offsetY = self.contentOffset.y;
	offsetY = MIN(offsetY, [self maxContentOffset]);
	offsetY = MAX(offsetY, [self minContentOffset]);
	
	if (offsetY != self.contentOffset.y)
	{
		CGPoint contentBottomOffset = CGPointMake(self.contentOffset.x, offsetY);
		[self setContentOffset:contentBottomOffset animated:animated];
	}
}

- (CGFloat)minContentOffset
{
	return -self.contentInset.top;
}

- (CGFloat)maxContentOffset
{
	return self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
}

- (BOOL)isPagedVerticalScroll
{
	return self.contentSize.height >= self.bounds.size.height * 1.5f;
}

@end
