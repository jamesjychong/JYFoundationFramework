//
//  UIScrollView+Scroll.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UIScrollView (Scroll)

- (void)scrollToTop:(BOOL)animated;
- (void)scrollToBottom:(BOOL)animated;
- (void)scrollToValidPosition:(BOOL)animated;

- (CGFloat)minContentOffset;
- (CGFloat)maxContentOffset;

- (BOOL)isPagedVerticalScroll;

@end
