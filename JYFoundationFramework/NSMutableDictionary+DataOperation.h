//
//  NSMutableDictionary+DataOperation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSMutableDictionary (DataOperation)

- (id)getObjectAndRemoveForKey:(id)key;

- (void)setObjectSafe:(id)anObject forKey:(id<NSCopying>)aKey;

@end
