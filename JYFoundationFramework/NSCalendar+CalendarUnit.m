//
//  NSCalendar+CalendarUnit.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSCalendar+CalendarUnit.h"

@implementation NSCalendar (CalendarUnit)

+ (NSCalendarUnit)calendarUnitYearMonthDayWeekday
{
	return NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
}

+ (NSCalendarUnit)calendarUnitMonthDay
{
	return NSCalendarUnitMonth | NSCalendarUnitDay;
}

+ (NSCalendarUnit)calendarUnitMonthDayWeekday
{
	return NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
}

@end
