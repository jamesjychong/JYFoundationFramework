//
//  NSIndexPath+Range.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSIndexPath (Range)

+ (NSArray *)indexPathsFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
			   numberOfRowForSection:(NSInteger (^)(NSInteger))block;

@end
