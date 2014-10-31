//
//  UIView+Animation.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/28/13

// Ref: http://www.raywenderlich.com/5478/uiview-animation-tutorial-practical-recipesv

@interface UIView (Animation)

- (void)flashView;

- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;

- (void)upsideDown:(float)secs option:(UIViewAnimationOptions)option;

- (void)addSubviewWithZoomInAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option;

- (void)removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option;

- (void)runSpinAnimationOnView:(UIView *)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;

- (void)bounce;
- (void)bounceWithDuration:(NSTimeInterval)duration scaleAmount:(CGFloat)scale completion:(void (^)(BOOL finished))completion;

@end
