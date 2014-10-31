//
//  UIViewController+Navigation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 4/20/14

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationBar *)navigationBar
{
	return self.navigationController.navigationBar;
}

- (UIToolbar *)toolBar
{
	return self.navigationController.toolbar;
}

- (BOOL)isNavigationBarTransparent
{
	UINavigationBar *navBar = [self navigationBar];
	return !(navBar.shadowImage == nil || [navBar backgroundImageForBarMetrics:UIBarMetricsDefault] == nil);
}

- (void)setNavigationBarTransparent:(BOOL)transparent
{
	// REF: http://stackoverflow.com/questions/19082963/how-to-make-completely-transparent-navigation-bar-in-ios-7

	UINavigationBar *navBar = [self navigationBar];
	if (transparent)
	{
		[navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
		[navBar setShadowImage:[UIImage new]];
	}
	else
	{
		[navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
		[navBar setShadowImage:nil];
	}
}

@end
