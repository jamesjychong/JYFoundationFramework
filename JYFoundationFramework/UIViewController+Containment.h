//
//  UIViewController+Containment.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 5/5/14

@interface UIViewController (Containment)

- (void)addChildViewControllerContainment:(UIViewController *)childController;
- (void)addChildViewControllerContainment:(UIViewController *)childController toView:(UIView *)view;

- (void)removeFromParentViewControllerContainment;

@end
