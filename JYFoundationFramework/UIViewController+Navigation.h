//
//  UIViewController+Navigation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 4/20/14

@interface UIViewController (Navigation)

- (UINavigationBar *)navigationBar;
- (UIToolbar *)toolBar;

- (BOOL)isNavigationBarTransparent;
- (void)setNavigationBarTransparent:(BOOL)transparent;

@end
