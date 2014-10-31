//
//  UITableView+IndexPath.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 5/12/14

@interface UITableView (IndexPath)

- (NSArray *)priorIndexPathCount:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)nextIndexPathCount:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath;

@end
