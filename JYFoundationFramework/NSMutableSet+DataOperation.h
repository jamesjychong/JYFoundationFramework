//
//  NSMutableSet+DataOperation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSMutableSet (DataOperation)

- (void)addObjectSafe:(id)object;

- (void)unionSetSafe:(NSSet *)otherSet;

@end
