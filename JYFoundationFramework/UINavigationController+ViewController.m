//
//  UINavigationController+ViewController.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UINavigationController+ViewController.h"

@implementation UINavigationController (ViewController)

- (NSInteger)numberOfViewControllers
{
	return self.viewControllers.count;
}

- (UIViewController *)lastViewController
{
	NSInteger count = [self numberOfViewControllers];
	if (count <= 1)
		return nil;

	return self.viewControllers[count - 1];
}

@end
