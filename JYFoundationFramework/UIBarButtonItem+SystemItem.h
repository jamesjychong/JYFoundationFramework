//
//  UIBarButtonItem+SystemItem.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UIBarButtonItem (SystemItem)

+ (instancetype)flexibleSpace;
+ (instancetype)systemItemFixedSpaceForBarButton;
+ (instancetype)systemItemFixedSpace:(CGFloat)space;

+ (instancetype)systemItemActionWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemAddWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemCancelWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemDoneWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemEditWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemTrashWithTarget:(id)target action:(SEL)action;
+ (instancetype)systemItemUndoWithTarget:(id)target action:(SEL)action;

@end
