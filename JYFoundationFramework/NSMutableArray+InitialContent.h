//
//  NSMutableArray+InitialContent.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSMutableArray (InitialContent)

+ (instancetype)createArrayNullWithCapacity:(NSUInteger)capacity;

- (void)clearContentNullWithCapacity:(NSUInteger)capacity;

@end
