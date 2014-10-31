//
//  NSMutableArray+DataOperation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSMutableArray+DataOperation.h"

@implementation NSMutableArray (DataOperation)

- (void)addObjectSafe:(id)anObject
{
	if (anObject == nil)
		return;
	[self addObject:anObject];
}

- (void)addObjectsFromArraySafe:(NSArray *)array
{
	if (array == nil)
		return;
	[self addObjectsFromArray:array];
}

@end
