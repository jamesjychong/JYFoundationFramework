//
//  UICollectionView+VerticalFlowLayout.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UICollectionView+VerticalFlowLayout.h"

@implementation UICollectionView (VerticalFlowLayout)

- (CGRect)verticalFlowFrameForVisibleCellsAtSection:(NSInteger)section
{
	NSInteger rowCount = [self numberOfItemsInSection:section];
	if (rowCount == 0)
		return CGRectZero;
	
	NSInteger handledCellCount = 0;
	CGRect frame = CGRectZero;
	
	for (UICollectionViewCell *cell in self.visibleCells)
	{
		NSIndexPath *indexPath = [self indexPathForCell:cell];		
		if (indexPath == nil || indexPath.section != section)
			continue;

		frame = CGRectUnion(frame, cell.frame);
		handledCellCount++;
	}
	return frame;
}

@end
