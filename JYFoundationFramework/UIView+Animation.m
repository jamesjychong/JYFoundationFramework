//
//  UIView+Animation.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/28/13

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)flashView
{
	UIView *flashView = [[UIView alloc] initWithFrame:self.bounds];
	flashView.backgroundColor = [UIColor whiteColor];
	[self addSubview:flashView];

	flashView.alpha = 0.8f;
	[UIView animateWithDuration:1.f animations:^{
		flashView.alpha = 0.0f;
	} completion:^(BOOL finished) {
		[flashView removeFromSuperview];
	}];
}

- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
		self.frame = CGRectMake(destination.x, destination.y, self.frame.size.width, self.frame.size.height);
	} completion:nil];
}

- (void)upsideDown:(float)secs option:(UIViewAnimationOptions)option
{
	[UIView animateWithDuration:secs delay:0.0 options:option animations:^{
		self.transform = CGAffineTransformRotate(self.transform, M_PI);
	} completion:nil];
}

- (void)addSubviewWithZoomInAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option
{
    // first reduce the view to 1/100th of its original dimension
    CGAffineTransform trans = CGAffineTransformScale(view.transform, 0.01, 0.01);
    view.transform = trans;	// do it instantly, no animation
    [self addSubview:view];
    // now return the view to normal dimension, animating this tranformation
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
		view.transform = CGAffineTransformScale(view.transform, 100.0, 100.0);
	} completion:nil];
}

- (void)removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option
{
	[UIView animateWithDuration:secs delay:0.0 options:option animations:^{
		self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

- (void)runSpinAnimationOnView:(UIView *)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat
{
	// http://stackoverflow.com/questions/9844925/uiview-infinite-360-degree-rotation-animation
	
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
	
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)bounce
{
    [self bounceWithDuration:0.38 scaleAmount:0.03 completion:nil];
}

- (void)bounceWithDuration:(NSTimeInterval)duration scaleAmount:(CGFloat)scale completion:(void (^)(BOOL finished))completion
{
	CGFloat durationHalf = duration * 0.5f;
	UIViewAnimationOptions options = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState;

    [UIView animateWithDuration:durationHalf delay:0 options:(UIViewAnimationOptionCurveEaseIn | options) animations:^{
		[self.layer setAffineTransform:CGAffineTransformMakeScale(1+scale, 1+scale)];
	} completion:^(BOOL finished){
		[UIView animateWithDuration:durationHalf delay:0 options:(UIViewAnimationOptionCurveEaseOut | options) animations:^{
			[self.layer setAffineTransform:CGAffineTransformMakeScale(1.0, 1.0)];
		} completion:completion];
	}];
}

@end
