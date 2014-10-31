//
//  NSDate+Components.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSDate+Components.h"

@implementation NSDate (Components)

- (NSDate *)dateByAddingDays:(NSUInteger)days
{
	return [self dateByAddingDays:days forCalendar:nil];
}

- (NSDate *)dateByAddingDays:(NSUInteger)days forCalendar:(NSCalendar *)calendar
{
	if (calendar == nil)
		calendar = [NSCalendar currentCalendar];

	NSDateComponents *dateComp = [NSDateComponents new];
	dateComp.day = days;
	return [calendar dateByAddingComponents:dateComp toDate:self options:0];
}

+ (NSDate *)dateWithDateComponents:(NSDateComponents *)components
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	gregorian.timeZone = components.timeZone;
	return [gregorian dateFromComponents:components];
}

- (NSDateComponents *)dateComponentsWithTimeZone:(NSTimeZone *)timeZone
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	gregorian.timeZone = timeZone;
	return [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
								  NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitTimeZone) fromDate:self];
}



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

@end
