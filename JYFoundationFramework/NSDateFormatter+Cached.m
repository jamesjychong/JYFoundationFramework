//
//  NSDateFormatter+Cached.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSDateFormatter+Cached.h"

static NSString * const kDateFormatterCachedKey = @"CachedDateFormatter";

@implementation NSDateFormatter (Cached)

+ (instancetype)dateFormatterForCurrentThread
{
	NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
	NSDateFormatter *formatter = [threadDict objectForKey:kDateFormatterCachedKey];
	if (formatter == nil)
	{
		formatter = [NSDateFormatter new];
		[formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];

		[threadDict setObject:formatter forKey:kDateFormatterCachedKey];
	}
	return formatter;
}

+ (instancetype)dateFormatterForCurrentThreadWithDateFormat:(NSString*)dateFormat
{
	NSDateFormatter *formatter = [self dateFormatterForCurrentThread];
	[formatter setDateFormat:dateFormat];

	return formatter;
}

@end
