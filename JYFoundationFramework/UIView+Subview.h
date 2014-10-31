//
//  UIView+Subview.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 8/21/13

@interface UIView (Subview)

+ (void)setAlpha:(CGFloat)alpha inViewList:(NSArray *)subviews;

- (void)setSubviewAlpha:(CGFloat)alpha;
- (void)addSubviewToBack:(UIView *)view;
- (void)removeAllSubviews;

@end
