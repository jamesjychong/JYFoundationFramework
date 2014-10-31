//
//  UIBarButtonItem+PlainItem.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIBarButtonItem+PlainItem.h"

@implementation UIBarButtonItem (PlainItem)

+ (instancetype)plainItemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
}

@end
