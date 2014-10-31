//
//  UICollectionView+TransitionAnimator.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UICollectionView+TransitionAnimator.h"

#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import "UICollectionView+TransitionAnimator.h"


@implementation UICollectionView (TransitionAnimator)

#pragma mark - Simulated properties

static char kAnimationDurationKey;
static char kTransitionLayoutKey;

- (NSNumber *)_animationDuration
{
    return (NSNumber *)objc_getAssociatedObject(self, &kAnimationDurationKey);
}

- (void)_setAnimationDuration:(NSNumber *)duration
{
    objc_setAssociatedObject(self, &kAnimationDurationKey, duration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UICollectionViewTransitionLayout *)_transitionLayout
{
    return (UICollectionViewTransitionLayout *)objc_getAssociatedObject(self, &kTransitionLayoutKey);
}

- (void)_setTransitionLayout:(UICollectionViewTransitionLayout *)layout
{
    objc_setAssociatedObject(self, &kTransitionLayoutKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - Transition logic

- (UICollectionViewTransitionLayout *)transitionToCollectionViewLayout:(UICollectionViewLayout *)layout
															  duration:(NSTimeInterval)duration
															completion:(UICollectionViewLayoutInteractiveTransitionCompletion)completion
{
	NSParameterAssert(layout != nil && duration > 0);
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
	
    [self _setAnimationDuration:@(duration)];
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(_updateProgress:)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
	
    UICollectionViewTransitionLayout *transitionLayout =
		[self startInteractiveTransitionToCollectionViewLayout:layout completion:^(BOOL completed, BOOL finish) {
		
        UICollectionViewTransitionLayout *transitionLayout = [self _transitionLayout];
        if ([transitionLayout conformsToProtocol:@protocol(UICollectionViewTransitionAnimatorLayout)])
		{
            id<UICollectionViewTransitionAnimatorLayout>layout = (id<UICollectionViewTransitionAnimatorLayout>)transitionLayout;
            [layout collectionViewDidCompleteTransitioning:self completed:completed finish:finish];
        }
		[[UIApplication sharedApplication] endIgnoringInteractionEvents];
        if (completion)
            completion(completed, finish);
		
		[self _setAnimationDuration:nil];
		[self _setTransitionLayout:nil];
    }];
    [self _setTransitionLayout:transitionLayout];
    
    return transitionLayout;
}

- (void)_updateProgress:(CADisplayLink *)link
{
    UICollectionViewLayout *layout = self.collectionViewLayout;
    if ([layout isKindOfClass:[UICollectionViewTransitionLayout class]])
	{
        UICollectionViewTransitionLayout *transitionLayout = (UICollectionViewTransitionLayout *)layout;
        if (transitionLayout.transitionProgress >= 1)
		{
            [self _finishTransition:link];
		}
		else
		{
            NSTimeInterval duration = [[self _animationDuration] floatValue];
            CGFloat progress = transitionLayout.transitionProgress + (link.duration * link.frameInterval) / duration;
            progress = MIN(1, progress);
            transitionLayout.transitionProgress = progress;
            [transitionLayout invalidateLayout];
        }
    }
	else
        [self _finishTransition:link];
}

- (void)_finishTransition:(CADisplayLink *)link
{
    [link invalidate];
	if (self._transitionLayout != nil)
		[self finishInteractiveTransition];
}

@end
