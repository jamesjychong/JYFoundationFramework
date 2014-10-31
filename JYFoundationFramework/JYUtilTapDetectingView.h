//
//  JYUtilTapDetectingView.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 9/16/13

@protocol JYUtilTapDetectingViewDelegate;

@interface JYUtilTapDetectingView : UIView
{
    // Touch detection
    CGPoint tapLocation;         // Needed to record location of single tap, which will only be registered after delayed perform.
    BOOL multipleTouches;        // YES if a touch event contains more than one touch; reset when all fingers are lifted.
    BOOL twoFingerTapIsPossible; // Set to NO when 2-finger tap can be ruled out (e.g. 3rd finger down, fingers touch down too far apart, etc).
}

@property (nonatomic, readwrite, weak) id <JYUtilTapDetectingViewDelegate> delegate;

@end


@protocol JYUtilTapDetectingViewDelegate <NSObject>

@optional
- (void)tapDetectingView:(JYUtilTapDetectingView *)view gotSingleTapAtPoint:(CGPoint)tapPoint;
- (void)tapDetectingView:(JYUtilTapDetectingView *)view gotDoubleTapAtPoint:(CGPoint)tapPoint;
- (void)tapDetectingView:(JYUtilTapDetectingView *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint;
- (void)tapDetectingViewTouchesEnded:(JYUtilTapDetectingView *)view;

@end
