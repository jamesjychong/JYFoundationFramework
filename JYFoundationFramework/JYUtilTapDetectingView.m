//
//  JYUtilTapDetectingView.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 9/16/13

#import "JYUtilTapDetectingView.h"

#define DOUBLE_TAP_DELAY 0.2

CGPoint midpointBetweenPoints(CGPoint a, CGPoint b);

@implementation JYUtilTapDetectingView

- (void)initJYUtilTapDetectingView
{
	twoFingerTapIsPossible = YES;
	multipleTouches = NO;
	
	[self setUserInteractionEnabled:YES];
	[self setMultipleTouchEnabled:YES];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		[self initJYUtilTapDetectingView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		[self initJYUtilTapDetectingView];
	}
	return self;
}


#pragma mark - Touch Handler

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // cancel any pending handleSingleTap messages
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleSingleTap) object:nil];
    
    // update our touch state
    if ([[event touchesForView:self] count] > 1)
        multipleTouches = YES;
    if ([[event touchesForView:self] count] > 2)
        twoFingerTapIsPossible = NO;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    BOOL allTouchesEnded = ([touches count] == [[event touchesForView:self] count]);
    
    // first check for plain single/double tap, which is only possible if we haven't seen multiple touches
    if (!multipleTouches) {
        UITouch *touch = [touches anyObject];
        tapLocation = [touch locationInView:self];
        
        if ([touch tapCount] == 1) {
            [self performSelector:@selector(handleSingleTap) withObject:nil afterDelay:DOUBLE_TAP_DELAY];
        } else if([touch tapCount] == 2) {
            [self handleDoubleTap];
        }
    }
    
    // check for 2-finger tap if we've seen multiple touches and haven't yet ruled out that possibility
    else if (multipleTouches && twoFingerTapIsPossible) {
        
        // case 1: this is the end of both touches at once
        if ([touches count] == 2 && allTouchesEnded) {
            int i = 0;
            NSUInteger tapCounts[2] = {0, 0};
			CGPoint tapLocations[2] = {0, 0};
            for (UITouch *touch in touches) {
                tapCounts[i]    = [touch tapCount];
                tapLocations[i] = [touch locationInView:self];
                i++;
            }
            if (tapCounts[0] == 1 && tapCounts[1] == 1) { // it's a two-finger tap if they're both single taps
                tapLocation = midpointBetweenPoints(tapLocations[0], tapLocations[1]);
                [self handleTwoFingerTap];
            }
        }
        
        // case 2: this is the end of one touch, and the other hasn't ended yet
        else if ([touches count] == 1 && !allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // if touch is a single tap, store its location so we can average it with the second touch location
                tapLocation = [touch locationInView:self];
            } else {
                twoFingerTapIsPossible = NO;
            }
        }
		
        // case 3: this is the end of the second of the two touches
        else if ([touches count] == 1 && allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // if the last touch up is a single tap, this was a 2-finger tap
                tapLocation = midpointBetweenPoints(tapLocation, [touch locationInView:self]);
                [self handleTwoFingerTap];
            }
        }
    }
	
    // if all touches are up, reset touch monitoring state
    if (allTouchesEnded) {
        twoFingerTapIsPossible = YES;
        multipleTouches = NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(tapDetectingViewTouchesEnded:)])
        [self.delegate tapDetectingViewTouchesEnded:self];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    twoFingerTapIsPossible = YES;
    multipleTouches = NO;
}


#pragma mark - JYUtilTapDetectingViewDelegate

- (void)handleSingleTap
{
    if ([self.delegate respondsToSelector:@selector(tapDetectingView:gotSingleTapAtPoint:)])
        [self.delegate tapDetectingView:self gotSingleTapAtPoint:tapLocation];
}

- (void)handleDoubleTap
{
    if ([self.delegate respondsToSelector:@selector(tapDetectingView:gotDoubleTapAtPoint:)])
        [self.delegate tapDetectingView:self gotDoubleTapAtPoint:tapLocation];
}

- (void)handleTwoFingerTap
{
    if ([self.delegate respondsToSelector:@selector(tapDetectingView:gotTwoFingerTapAtPoint:)])
        [self.delegate tapDetectingView:self gotTwoFingerTapAtPoint:tapLocation];
}

@end


CGPoint midpointBetweenPoints(CGPoint a, CGPoint b)
{
    CGFloat x = (a.x + b.x) / 2.0;
    CGFloat y = (a.y + b.y) / 2.0;
    return CGPointMake(x, y);
}
