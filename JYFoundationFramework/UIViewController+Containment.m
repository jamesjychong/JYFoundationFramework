//
//  UIViewController+Containment.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 5/5/14

#import "UIViewController+Containment.h"

@implementation UIViewController (Containment)

- (void)addChildViewControllerContainment:(UIViewController *)childController
{
	[self addChildViewControllerContainment:childController toView:self.view];
}

- (void)addChildViewControllerContainment:(UIViewController *)childController toView:(UIView *)view
{
	if (childController.parentViewController == self && childController.view.superview == view)
		return;

	[self addChildViewController:childController];
	[view addSubview:childController.view];
	childController.view.frame = view.bounds;
	[childController didMoveToParentViewController:self];
}

- (void)removeFromParentViewControllerContainment
{
	[self willMoveToParentViewController:nil];
	[self.view removeFromSuperview];
	[self removeFromParentViewController];
}

@end
