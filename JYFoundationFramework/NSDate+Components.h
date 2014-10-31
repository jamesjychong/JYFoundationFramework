//
//  NSDate+Components.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSDate (Components)

- (NSDate *)dateByAddingDays:(NSUInteger)days;

- (NSDate *)dateByAddingDays:(NSUInteger)days forCalendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithDateComponents:(NSDateComponents *)components;

- (NSDateComponents *)dateComponentsWithTimeZone:(NSTimeZone *)timeZone;

// Date Component

- (NSDateComponents *)dateComponent;
- (NSDateComponents *)dateComponentForTimeZone:(NSTimeZone *)timeZone;
- (NSDateComponents *)dateComponentForCalendar:(NSCalendar *)calendar;

@end
