//
//  UICollectionViewCell+Animation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#define kUICollectionViewCellBounceAnimationDuration    (0.36f)
#define kUICollectionViewCellBounceAnimationScaleAmount (0.1f)

@interface UICollectionViewCell (Animation)

- (void)bounceCellSelectWithCompletion:(void (^)(BOOL finished))completion;

@end
