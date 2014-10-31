//
//  JYUtilTapDetectingImageView.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 8/17/13

#import "JYUtilTapDetectingImageView.h"

@implementation JYUtilTapDetectingImageView

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame]))
	{
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (id)initWithImage:(UIImage *)image
{
	if ((self = [super initWithImage:image]))
	{
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
	if ((self = [super initWithImage:image highlightedImage:highlightedImage]))
	{
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = touch.tapCount;
	switch (tapCount)
	{
		case 1:
			[self handleSingleTap:touch];
			break;
		case 2:
			[self handleDoubleTap:touch];
			break;
		case 3:
			[self handleTripleTap:touch];
			break;
		default:
			break;
	}
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)handleSingleTap:(UITouch *)touch
{
	if ([self.tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)])
		[self.tapDelegate imageView:self singleTapDetected:touch];
}

- (void)handleDoubleTap:(UITouch *)touch
{
	if ([self.tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)])
		[self.tapDelegate imageView:self doubleTapDetected:touch];
}

- (void)handleTripleTap:(UITouch *)touch
{
	if ([self.tapDelegate respondsToSelector:@selector(imageView:tripleTapDetected:)])
		[self.tapDelegate imageView:self tripleTapDetected:touch];
}

@end
