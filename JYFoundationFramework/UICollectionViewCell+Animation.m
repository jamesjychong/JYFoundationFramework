//
//  UICollectionViewCell+Animation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIView+Animation.h"
#import "UICollectionViewCell+Animation.h"

@implementation UICollectionViewCell (Animation)

- (void)bounceCellSelectWithCompletion:(void (^)(BOOL finished))completion
{
	[self bounceWithDuration:kUICollectionViewCellBounceAnimationDuration scaleAmount:-kUICollectionViewCellBounceAnimationScaleAmount completion:completion];
}

@end
