//
//  NSArray+DataOperation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSArray+DataOperation.h"

@implementation NSArray (DataOperation)

- (BOOL)isEmpty
{
	return self.count == 0;
}

- (id)randomObject
{
	if (self.count == 0)
		return nil;

	return self[arc4random() % [self count]];
}

- (id)objectAtIndexSafe:(NSInteger)index
{
	if (self.count < 1 || index < 0 || index >= self.count)
		return nil;

	return self[index];
}

- (id)anyNonNullObject
{
	for (id object in self)
	{
		if (![object isEqual:[NSNull null]])
			return object;
	}
	return nil;
}


#pragma mark - Retrieve by class type

- (id)firstObjectOfClass:(Class)classType
{
	for (id object in self)
	{
		if ([object isKindOfClass:classType])
			return object;
	}
	return nil;
}

- (id)lastObjectOfClass:(Class)classType
{
	id tempObject = nil;
	for (id object in self)
	{
		if ([object isKindOfClass:classType])
			tempObject = object;
	}
	return tempObject;
}

- (NSArray *)objectsOfClass:(Class)classType
{
	NSMutableArray *objects = [NSMutableArray array];
	for (id object in self)
	{
		if ([object isKindOfClass:classType])
			[objects addObject:object];
	}
	return objects;
}

@end
