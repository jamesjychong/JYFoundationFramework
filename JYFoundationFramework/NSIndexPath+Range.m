//
//  NSIndexPath+Range.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSIndexPath+Range.h"

@implementation NSIndexPath (Range)

+ (NSArray *)indexPathsFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
			   numberOfRowForSection:(NSInteger (^)(NSInteger))block
{
	NSInteger fromSec = 0;
	NSInteger fromRow = 0;
	NSInteger toSec = 0;
	NSInteger toRow = 0;

	// prepare from and to section and row
	switch ([fromIndexPath compare:toIndexPath])
	{
		case NSOrderedSame:
			return @[ fromIndexPath ];
			
		case NSOrderedAscending:
			fromSec = fromIndexPath.section;
			fromRow = fromIndexPath.row;
			toSec = toIndexPath.section;
			toRow = toIndexPath.row;
			break;
			
		case NSOrderedDescending:
			fromSec = toIndexPath.section;
			fromRow = toIndexPath.row;
			toSec = fromIndexPath.section;
			toRow = fromIndexPath.row;
			break;
	}
	
	// create array of index paths
	NSMutableArray *indexPaths = [NSMutableArray array];
	
	// interate section from fromSec to one before toSec
	NSInteger row = fromRow;
	for (NSInteger section = fromSec; section < toSec; section++)
	{
		NSInteger rowCount = block(section);
		for (; row < rowCount; row++)
			[indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
		row = 0;
	}
	
	// handle section == toSec
	for (; row <= toRow; row++)
		[indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:toSec]];
	
	return indexPaths;
}

@end
