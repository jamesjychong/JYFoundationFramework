//
//  JYUtilTapDetectingImageView.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 8/17/13

@protocol JYUtilTapDetectingImageViewDelegate;


@interface JYUtilTapDetectingImageView : UIImageView

- (void)handleSingleTap:(UITouch *)touch;
- (void)handleDoubleTap:(UITouch *)touch;
- (void)handleTripleTap:(UITouch *)touch;

@property (nonatomic, readwrite, assign) id<JYUtilTapDetectingImageViewDelegate> tapDelegate;

@end


@protocol JYUtilTapDetectingImageViewDelegate <NSObject>

@optional
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView tripleTapDetected:(UITouch *)touch;

@end
