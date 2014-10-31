//
//  UICollectionView+Display.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UICollectionView+Display.h"

@implementation UICollectionView (Display)

- (void)reloadVisibleCells
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (UICollectionViewCell *cell in self.visibleCells)
	{
		NSIndexPath *indexPath = [self indexPathForCell:cell];
		if (indexPath == nil)
			continue;
        [indexPaths addObject:indexPath];
	}
    [self reloadItemsAtIndexPaths:indexPaths];
}

- (void)reloadVisibleSections
{
	NSMutableIndexSet *indices = [NSMutableIndexSet indexSet];
    for (UICollectionViewCell *cell in self.visibleCells)
	{
		NSIndexPath *indexPath = [self indexPathForCell:cell];
		[indices addIndex:indexPath.section];
	}
	[self reloadSections:indices];
}

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated
{
	// REF: https://gist.github.com/mipstian/4571986
    if (!animated)
	{
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    }

    [self reloadItemsAtIndexPaths:indexPaths];

    if (!animated)
	{
        [CATransaction commit];
    }
}

- (void)clearSelectionStateForVisibleCells
{
	for (UICollectionViewCell *cell in self.visibleCells)
	{
		if (cell.selected)
			cell.selected = NO;
	}
}

@end
