//
//  UITableView+IndexPath.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 5/12/14

#import "UITableView+IndexPath.h"

@implementation UITableView (IndexPath)

/** Retrieve NSIndexPath for a certain number of rows preceding particular NSIndexPath in the table view.
 *
 * @param  tableView  The tableview for which we're going to retrieve indexPaths.
 * @param  count      The number of rows to retrieve
 * @param  indexPath  The indexPath where we're going to start (presumably the first visible indexPath)
 *
 * @return            An array of indexPaths.
 */
- (NSArray *)priorIndexPathCount:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath
{
	// REF: http://stackoverflow.com/questions/15701556/sdwebimage-does-not-load-remote-images-until-scroll
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
	
    for (NSInteger i = 0; i < count; i++)
	{
        if (row == 0)
		{
            if (section == 0)
                return indexPaths;
			else
			{
                section--;
                row = [self numberOfRowsInSection:section] - 1;
            }
        }
		else
            row--;
        [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    }
    return indexPaths;
}

/** Retrieve NSIndexPath for a certain number of following particular NSIndexPath in the table view.
 *
 * @param  tableView  The tableview for which we're going to retrieve indexPaths.
 * @param  count      The number of rows to retrieve
 * @param  indexPath  The indexPath where we're going to start (presumably the last visible indexPath)
 *
 * @return            An array of indexPaths.
 */
- (NSArray *)nextIndexPathCount:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath
{
	// REF: http://stackoverflow.com/questions/15701556/sdwebimage-does-not-load-remote-images-until-scroll
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    NSInteger rowCountForSection = [self numberOfRowsInSection:section];
	
    for (NSInteger i = 0; i < count; i++)
	{
        row++;
        if (row == rowCountForSection)
		{
            row = 0;
            section++;
            if (section == [self numberOfSections])
                return indexPaths;

            rowCountForSection = [self numberOfRowsInSection:section];
        }
        [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    }
    return indexPaths;
}

@end
