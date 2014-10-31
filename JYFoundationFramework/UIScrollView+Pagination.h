//
//  UIScrollView+Pagination.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UIScrollView (Pagination)

- (NSInteger)currentPage;
- (NSInteger)currentPageInScrolling;
- (NSInteger)numberOfPages;

// Frame Calculations
+ (CGRect)frameForPagingScrollViewWithPadding:(CGFloat)padding bounds:(CGRect)bounds;
- (CGRect)frameForPageAtIndex:(NSUInteger)index padding:(CGFloat)padding;
- (CGSize)contentSizeForPagingScrollViewWithPageCount:(NSUInteger)count;
- (CGPoint)contentOffsetForPageAtIndex:(NSUInteger)index;

@end
