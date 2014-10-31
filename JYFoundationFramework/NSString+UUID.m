//
//  NSString+UUID.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString (UUID)

+ (NSString *)createUUID
{
	return [[NSUUID UUID] UUIDString];
}

@end
