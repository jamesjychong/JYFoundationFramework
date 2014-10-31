//
//  UITableViewCell+Identifier.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/19/13

#import "UITableViewCell+Identifier.h"

@implementation UITableViewCell (Identifier)

+ (NSString *)cellReuseIdentifier
{
	NSString *cellReuseId = nil;
	if (cellReuseId == nil)
		cellReuseId = NSStringFromClass([self class]);

	return cellReuseId;
}

@end
