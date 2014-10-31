//
//  NSMutableArray+InitialContent.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSMutableArray+InitialContent.h"

@implementation NSMutableArray (InitialContent)

+ (instancetype)createArrayNullWithCapacity:(NSUInteger)capacity
{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:capacity];
	[array clearContentNullWithCapacity:capacity];

	return array;
}

- (void)clearContentNullWithCapacity:(NSUInteger)capacity
{
	[self removeAllObjects];

	for (int i = 0; i < capacity; i++)
		[self addObject:[NSNull null]];
}

@end
