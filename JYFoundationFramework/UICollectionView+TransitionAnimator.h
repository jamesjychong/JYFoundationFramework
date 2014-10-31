//
//  UICollectionView+TransitionAnimator.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

// Referred from TLLayoutTransitioning project

@protocol UICollectionViewTransitionAnimatorLayout <NSObject>

- (void)collectionViewDidCompleteTransitioning:(UICollectionView *)collectionView completed:(BOOL)completed finish:(BOOL)finish;

@end


@interface UICollectionView (TransitionAnimator)

- (UICollectionViewTransitionLayout *)transitionToCollectionViewLayout:(UICollectionViewLayout *)layout
															  duration:(NSTimeInterval)duration
															completion:(UICollectionViewLayoutInteractiveTransitionCompletion)completion;

@end
