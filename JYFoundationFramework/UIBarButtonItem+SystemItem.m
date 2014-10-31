//
//  UIBarButtonItem+SystemItem.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIBarButtonItem+SystemItem.h"

@implementation UIBarButtonItem (SystemItem)

+ (instancetype)flexibleSpace
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

+ (instancetype)systemItemFixedSpaceForBarButton
{
	return [UIBarButtonItem systemItemFixedSpace:-7];
}

+ (instancetype)systemItemFixedSpace:(CGFloat)space
{
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	item.width = space;
	return item;
}

+ (instancetype)systemItemActionWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:target action:action];
}

+ (instancetype)systemItemAddWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:target action:action];
}

+ (instancetype)systemItemCancelWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:target action:action];
}

+ (instancetype)systemItemDoneWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:target action:action];
}

+ (instancetype)systemItemEditWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:target action:action];
}

+ (instancetype)systemItemTrashWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:target action:action];
}

+ (instancetype)systemItemUndoWithTarget:(id)target action:(SEL)action
{
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:target action:action];
}

@end
