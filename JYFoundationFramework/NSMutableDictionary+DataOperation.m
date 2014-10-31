//
//  NSMutableDictionary+DataOperation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSMutableDictionary+DataOperation.h"

@implementation NSMutableDictionary (DataOperation)

- (id)getObjectAndRemoveForKey:(id)key
{
	id object = [self objectForKey:key];
	if (object == nil)
		return nil;
	[self removeObjectForKey:key];

	return object;
}

- (void)setObjectSafe:(id)anObject forKey:(id<NSCopying>)aKey
{
	if (anObject == nil || aKey == nil)
		return;

	[self setObject:anObject forKey:aKey];
}

@end
