//
//  UIColor+JYUtil.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "UIColor+JYUtil.h"

@implementation UIColor (JYUtil)

+ (BOOL)shouldUseBrightForegroundColorForBackgroundColor:(UIColor *)color
{
    CGFloat scaledRed, scaledGreen, scaledBlue, scaledAlpha;
    [color getRed:&scaledRed green:&scaledGreen blue:&scaledBlue alpha:&scaledAlpha];
	
    // Counting the perceptive luminance - human eye favors green color...
    double a = 1 - (0.299 * scaledRed + 0.587 * scaledGreen + 0.114 * scaledBlue);
    
    if (a < 0.5)
        return NO;
    
    return YES;
}

- (UIColor *)darkerColor
{
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.4, 0.0) green:MAX(g - 0.4, 0.0) blue:MAX(b - 0.4, 0.0) alpha:a];

    return nil;
}

@end
