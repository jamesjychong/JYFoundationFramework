//
//  NSDateFormatter+Cached.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

// REF: https://github.com/mglagola/iOS-Extensions/blob/master/Categories/NSDateFormatter%2BCached.m

@interface NSDateFormatter (Cached)

+ (instancetype)dateFormatterForCurrentThread;
+ (instancetype)dateFormatterForCurrentThreadWithDateFormat:(NSString*)dateFormat;

@end
