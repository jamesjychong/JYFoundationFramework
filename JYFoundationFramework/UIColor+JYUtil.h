//
//  UIColor+JYUtil.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface UIColor (JYUtil)

+ (BOOL)shouldUseBrightForegroundColorForBackgroundColor:(UIColor *)color;

- (UIColor *)darkerColor;

@end
