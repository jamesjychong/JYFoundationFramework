//
//  NSArray+DataOperation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSArray (DataOperation)

- (BOOL)isEmpty;

- (id)randomObject;

- (id)objectAtIndexSafe:(NSInteger)index;

- (id)anyNonNullObject;


// Retrieve by class type

- (id)firstObjectOfClass:(Class)classType;

- (id)lastObjectOfClass:(Class)classType;

- (NSArray *)objectsOfClass:(Class)classType;

@end
