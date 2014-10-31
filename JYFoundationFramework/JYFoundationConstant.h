//
//  JYFoundationConstant.h
//  JYFoundationFramework
//
//  Created by James Chong on 10/20/14.
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#define MaskByte(X) ((X) & 0xFF)

extern const Byte kByteMinValue;
extern const Byte kByteMaxValue;

@interface JYFoundationConstant : NSObject

+ (UIViewAutoresizing)viewAutoresizingMaskSetAll;
+ (UIViewAutoresizing)viewAutoresizingMaskSetAllMargin;
+ (UIViewAutoresizing)viewAutoresizingMaskSetAllSize;

@end
