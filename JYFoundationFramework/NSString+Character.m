//
//  NSString+Character.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSString+Character.h"

@implementation NSString (Character)

- (NSString *)trimmedString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (unichar)lastCharacter
{
	if (self.length == 0)
		return 0;

	return [self characterAtIndex:(self.length - 1)];
}

- (unichar)firstCharacter
{
	if (self.length == 0)
		return 0;

	return [self characterAtIndex:0];
}

@end
