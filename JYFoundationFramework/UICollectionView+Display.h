//
//  UICollectionView+Display.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UICollectionView (Display)

- (void)reloadVisibleCells;

- (void)reloadVisibleSections;

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated;

- (void)clearSelectionStateForVisibleCells;

@end
