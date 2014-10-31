//
//  UIScrollView+Pagination.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIScrollView+Pagination.h"

@implementation UIScrollView (Pagination)

- (NSInteger)currentPage
{
    return (NSInteger)(self.contentOffset.x / self.frame.size.width);
}

- (NSInteger)currentPageInScrolling
{
    // Update the pageControl > 50% of the previous/next page is visible.
	CGFloat pageWidth = self.frame.size.width;
	CGFloat contentOffsetX = self.contentOffset.x;

	//return floor((contentOffsetX - pageWidth / 2) / pageWidth) + 1;
	return lround(contentOffsetX / pageWidth);
}

- (NSInteger)numberOfPages
{
	return self.contentSize.width / self.bounds.size.width;
}


#pragma mark - Frame Calculations

+ (CGRect)frameForPagingScrollViewWithPadding:(CGFloat)padding bounds:(CGRect)bounds
{
    CGRect frame = bounds;
    frame.origin.x -= padding;
    frame.size.width += (2 * padding);
    return CGRectIntegral(frame);
}

- (CGRect)frameForPageAtIndex:(NSUInteger)index padding:(CGFloat)padding
{
    // We have to use our paging scroll view's bounds, not frame, to calculate the page placement. When the device is in
    // landscape orientation, the frame will still be in portrait because the pagingScrollView is the root view controller's
    // view, so its frame is in window coordinate space, which is never rotated. Its bounds, however, will be in landscape
    // because it has a rotation transform applied.
    CGRect bounds = self.bounds;
    CGRect pageFrame = bounds;
    pageFrame.size.width -= (2 * padding);
    pageFrame.origin.x = (bounds.size.width * index) + padding;
    return CGRectIntegral(pageFrame);
}

- (CGSize)contentSizeForPagingScrollViewWithPageCount:(NSUInteger)count
{
    // We have to use the paging scroll view's bounds to calculate the contentSize, for the same reason outlined above.
    CGRect bounds = self.bounds;
    return CGSizeMake(bounds.size.width * count, bounds.size.height);
}

- (CGPoint)contentOffsetForPageAtIndex:(NSUInteger)index
{
	CGFloat pageWidth = self.bounds.size.width;
	CGFloat newOffset = index * pageWidth;
	return CGPointMake(newOffset, self.contentOffset.y);
}

@end
