//
//  NSMutableSet+DataOperation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSMutableSet+DataOperation.h"

@implementation NSMutableSet (DataOperation)

- (void)addObjectSafe:(id)object
{
	if (object == nil)
		return;

	[self addObject:object];
}

- (void)unionSetSafe:(NSSet *)otherSet
{
	if (otherSet == nil || otherSet.count == 0)
		return;

	[self unionSet:otherSet];
}

@end
