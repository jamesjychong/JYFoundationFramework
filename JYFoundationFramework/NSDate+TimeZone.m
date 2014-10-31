//
//  NSDate+TimeZone.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/16/13

#import "NSDate+TimeZone.h"
#import "NSDate+Components.h"

@implementation NSDate (TimeZone)

#pragma mark - Same Month

- (BOOL)isSameMonth:(NSDate *)anotherDate
{
	return [self isSameDay:anotherDate timeZone:[NSTimeZone defaultTimeZone]];
}

- (BOOL)isSameMonth:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = timeZone;
	
	return [self isSameMonth:anotherDate calendar:calendar];
}

- (BOOL)isSameMonth:(NSDate *)anotherDate calendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth;
	NSDateComponents *components1 = [calendar components:calendarUnit fromDate:self];
	NSDateComponents *components2 = [calendar components:calendarUnit fromDate:anotherDate];
	
	return ([components1 year] == [components2 year] && [components1 month] == [components2 month]);
}


#pragma mark - Same Day

- (BOOL)isSameDay:(NSDate *)anotherDate
{
	return [self isSameDay:anotherDate timeZone:[NSTimeZone defaultTimeZone]];
}

- (BOOL)isSameDay:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = timeZone;
	
	return [self isSameDay:anotherDate calendar:calendar];
}

- (BOOL)isSameDay:(NSDate *)anotherDate calendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
	NSDateComponents *components1 = [calendar components:calendarUnit fromDate:self];
	NSDateComponents *components2 = [calendar components:calendarUnit fromDate:anotherDate];
	
	return ([components1 year]  == [components2 year] &&
			[components1 month] == [components2 month] &&
			[components1 day]   == [components2 day]);
}


#pragma mark - Is Today

- (BOOL)isToday
{
	return [self isSameDay:[NSDate date]];
}

- (BOOL)isTodayForTimeZone:(NSTimeZone *)timeZone
{
	return [self isSameDay:[NSDate date] timeZone:timeZone];
}

- (BOOL)isTodayForCalendar:(NSCalendar *)calendar
{
	return [self isSameDay:[NSDate date] calendar:calendar];
}


#pragma mark - Date Component

- (NSDateComponents *)dateComponent
{
	return [self dateComponentForTimeZone:[NSTimeZone defaultTimeZone]];
}

- (NSDateComponents *)dateComponentForTimeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = timeZone;
	
	return [self dateComponentForCalendar:calendar];
}

- (NSDateComponents *)dateComponentForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = (NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay | NSCalendarUnitWeekday |
								   NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear |
								   NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
	return [calendar components:calendarUnit fromDate:self];
}


#pragma mark - Date at beginning of day

- (NSDate *)dateAtBeginningOfDay
{
	return [self dateAtBeginningOfDayForTimeZone:[NSTimeZone defaultTimeZone]];
}

- (NSDate *)dateAtBeginningOfDayForTimeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:timeZone];
    
	return [self dateAtBeginningOfDayForCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfDayForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];

    return [self dateAtBeginningOfDayForCalendar:calendar targetCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfDayForCalendar:(NSCalendar *)calendar targetCalendar:(NSCalendar *)targetCalendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];

	if (targetCalendar == nil)
		targetCalendar = [NSCalendar currentCalendar];
	
    // Selectively convert the date components (year, month, day) of the input date
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *dateComps = [calendar components:calendarUnit fromDate:self];
    
    // Set the time components manually
	dateComps.hour = 0;
	dateComps.minute = 0;
	dateComps.second = 0;
	
    // Convert back
    return [targetCalendar dateFromComponents:dateComps];
}


#pragma mark - Date at beginning of week

- (NSDate *)dateAtBeginningOfWeekForTimeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:timeZone];
    
	return [self dateAtBeginningOfWeekForCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfWeekForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
    return [self dateAtBeginningOfWeekForCalendar:calendar targetCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfWeekForCalendar:(NSCalendar *)calendar targetCalendar:(NSCalendar *)targetCalendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	if (targetCalendar == nil)
		targetCalendar = [NSCalendar currentCalendar];
	
    // Selectively convert the date components (year, month, day) of the input date
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *dateComps = [calendar components:calendarUnit fromDate:self];

    // Set the time components manually
	dateComps.day -= (dateComps.weekday - 1);

    // Convert back
    return [targetCalendar dateFromComponents:dateComps];
}


#pragma mark - Date at beginning of month

- (NSDate *)dateAtBeginningOfMonth
{
	return [self dateAtBeginningOfDayForTimeZone:[NSTimeZone defaultTimeZone]];
}

- (NSDate *)dateAtBeginningOfMonthForTimeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:timeZone];
	
	return [self dateAtBeginningOfMonthForCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfMonthForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComps = [calendar components:calendarUnit fromDate:self];
    dateComps.day = 1;
	
    return [calendar dateFromComponents:dateComps];
}

- (NSDate *)dateAtEndingOfMonthForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComps = [calendar components:calendarUnit fromDate:self];
    dateComps.day = 0;
	dateComps.month++;

    return [calendar dateFromComponents:dateComps];
}

- (NSDate *)dateAtBeginningOfNextMonth
{
	return [self dateAtBeginningOfNextMonthForTimeZone:[NSTimeZone defaultTimeZone]];
}

- (NSDate *)dateAtBeginningOfNextMonthForTimeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:timeZone];
	
	return [self dateAtBeginningOfNextMonthForCalendar:calendar];
}

- (NSDate *)dateAtBeginningOfNextMonthForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
	NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComps = [calendar components:calendarUnit fromDate:self];
    dateComps.day = 1;
    dateComps.month++;
	
    return [calendar dateFromComponents:dateComps];
}


#pragma mark - Date of next/prev day & month

- (NSDate *)dateWithDay:(NSUInteger)day calendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];

	NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
	[components setDay:day];

	return [calendar dateFromComponents:components];
}

- (NSDate *)nextDayForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
    NSDateComponents *components = [[NSDateComponents alloc] init];
	components.day = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)previousDayForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
    NSDateComponents *components = [[NSDateComponents alloc] init];
	components.day = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)nextMonthForTimeZone:(NSTimeZone *)timeZone
{
	NSDateComponents *components = [self dateComponentsWithTimeZone:timeZone];
	components.month++;
	if (components.month > 12)
	{
		components.month = 1;
		components.year++;
	}
	components.minute = components.second = components.hour = 0;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)nextMonthForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
    NSDateComponents *components = [[NSDateComponents alloc] init];
	components.month = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)previousMonthWithTimeZone:(NSTimeZone *)timeZone
{
	NSDateComponents *components = [self dateComponentsWithTimeZone:timeZone];
	components.month--;
	if(components.month < 1)
	{
		components.month = 12;
		components.year--;
	}
	components.second = components.minute = components.hour = 0;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)previousMonthForCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];
	
    NSDateComponents *components = [[NSDateComponents alloc] init];
	components.month = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}








- (NSDate *)normalizeDateByComponentFlags:(NSUInteger)flags forTimeZone:(NSTimeZone *)timeZone
{
	if (timeZone == nil)
		timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = timeZone;
	
	NSDateComponents *components = [calendar components:flags fromDate:self];
	return [calendar dateFromComponents:components];
}

- (NSTimeInterval)timeIntervalBetweenSourceTimeZone:(NSTimeZone *)sourceTimeZone
									 targetTimeZone:(NSTimeZone *)targetTimeZone
{
	if (sourceTimeZone == nil)
		sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	if (targetTimeZone == nil)
		targetTimeZone = [NSTimeZone systemTimeZone];
	
	NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
	NSInteger targetGMTOffset = [targetTimeZone secondsFromGMTForDate:self];

	return targetGMTOffset - sourceGMTOffset;
}

- (NSDate *)convertDateInTimeZone:(NSTimeZone *)sourceTimeZone toTimeZone:(NSTimeZone *)targetTimeZone
{
	NSTimeInterval interval = [self timeIntervalBetweenSourceTimeZone:sourceTimeZone targetTimeZone:targetTimeZone];
	
	return [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
}

- (NSDate *)convertDateToTimeZoneName:(NSString *)targetTimeZoneName
{
	NSTimeZone *targetTimeZone = nil;
	if (targetTimeZoneName != nil && targetTimeZoneName.length > 0)
		targetTimeZone = [NSTimeZone timeZoneWithName:targetTimeZoneName];
	
	return [self convertDateInTimeZone:nil toTimeZone:targetTimeZone];
}



@end
