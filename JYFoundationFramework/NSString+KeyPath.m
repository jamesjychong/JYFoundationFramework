//
//  NSString+KeyPath.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSString+KeyPath.h"

@implementation NSString (KeyPath)

- (NSString *)appendToKeyPath:(NSString *)path
{
	return [NSString stringWithFormat:@"%@.%@", self, path];
}

- (NSString *)appendKeyPath:(NSString *)keyPath
{
	return [NSString stringWithFormat:@"%@.%@", keyPath, self];
}

@end
