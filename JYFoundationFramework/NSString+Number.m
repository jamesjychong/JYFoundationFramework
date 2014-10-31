//
//  NSString+Number.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

+ (NSString *)stringWithInteger:(NSInteger)integer
{
#if __LP64__
	return [NSString stringWithFormat:@"%ld", integer];
#else
	return [NSString stringWithFormat:@"%d", integer];
#endif
}

- (NSNumber *)convertIntegerStringToNumber
{
	static NSNumberFormatter *formatter = nil;
	if (formatter == nil)
	{
		formatter = [NSNumberFormatter new];
		[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	}
	return [formatter numberFromString:self];
}

@end
