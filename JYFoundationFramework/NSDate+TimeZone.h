//
//  NSDate+TimeZone.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//
//  Created on 7/16/13

@interface NSDate (TimeZone)

// Same Month (Year, Month)

/**
 * Returns whether the compared date shares the same year and month with respect to the default time zone.
 *
 * @param	anotherDate		date to compare
 * @return YES if the two dates share the same year and month. Otherwise NO.
 */
- (BOOL)isSameMonth:(NSDate *)anotherDate;

/**
 * Returns whether the compared date shares the same year and month with respect to the given time zone.
 *
 * @param	anotherDate		date to compare
 * @param	timeZone		The time zone used to determine the current day. GMT is used when nil is given.
 * @return YES if the two dates share the same year and month. Otherwise NO.
 */
- (BOOL)isSameMonth:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone;

/**
 * Returns whether the compared date shares the same year and month with respect to the given calendar.
 *
 * @param	anotherDate		date to compare
 * @param	calendar		The calendar used to determine the current day. Current calendar is used when nil is given.
 * @return YES if the two dates share the same year and month. Otherwise NO.
 */
- (BOOL)isSameMonth:(NSDate *)anotherDate calendar:(NSCalendar *)calendar;


// Same Day (Year, Month, Day)

/**
 * Returns whether the compared date shares the date with respect to the default time zone.
 *
 * @param	anotherDate		date to compare
 * @return YES if the two dates share the same year, month, and day. Otherwise NO.
 */
- (BOOL)isSameDay:(NSDate *)anotherDate;

/**
 * Returns whether the compared date shares the date with respect to the given time zone.
 *
 * @param	anotherDate		date to compare
 * @param	timeZone		The time zone used to determine the current day. GMT is used when nil is given.
 * @return YES if the two dates share the same year, month, and day. Otherwise NO.
 */
- (BOOL)isSameDay:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone;

/**
 * Returns whether the compared date shares the date with respect to the given calendar.
 *
 * @param	anotherDate		date to compare
 * @param	calendar		The calendar used to determine the current day. Current calendar is used when nil is given.
 * @return YES if the two dates share the same year, month, and day. Otherwise NO.
 */
- (BOOL)isSameDay:(NSDate *)anotherDate calendar:(NSCalendar *)calendar;


// Is Today

/**
 * Returns a Boolean value that indicates whether the date object is that same date information as the current day.
 *
 * @return YES if the date object represents the current date, otherwise NO.
 */
- (BOOL)isToday;
- (BOOL)isTodayForTimeZone:(NSTimeZone *)timeZone;
- (BOOL)isTodayForCalendar:(NSCalendar *)calendar;


// Date at beginning of day

- (NSDate *)dateAtBeginningOfDay;
- (NSDate *)dateAtBeginningOfDayForTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)dateAtBeginningOfDayForCalendar:(NSCalendar *)calendar;
- (NSDate *)dateAtBeginningOfDayForCalendar:(NSCalendar *)calendar targetCalendar:(NSCalendar *)targetCalendar;


// Date at beginning of week

- (NSDate *)dateAtBeginningOfWeekForTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)dateAtBeginningOfWeekForCalendar:(NSCalendar *)calendar;
- (NSDate *)dateAtBeginningOfWeekForCalendar:(NSCalendar *)calendar targetCalendar:(NSCalendar *)targetCalendar;


// Date at beginning of month

- (NSDate *)dateAtBeginningOfMonth;
- (NSDate *)dateAtBeginningOfMonthForTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)dateAtBeginningOfMonthForCalendar:(NSCalendar *)calendar;
- (NSDate *)dateAtEndingOfMonthForCalendar:(NSCalendar *)calendar;

- (NSDate *)dateAtBeginningOfNextMonth;
- (NSDate *)dateAtBeginningOfNextMonthForTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)dateAtBeginningOfNextMonthForCalendar:(NSCalendar *)calendar;


// Date of next/prev day & month

- (NSDate *)dateWithDay:(NSUInteger)day calendar:(NSCalendar *)calendar;
- (NSDate *)nextDayForCalendar:(NSCalendar *)calendar;
- (NSDate *)previousDayForCalendar:(NSCalendar *)calendar;
- (NSDate *)nextMonthForTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)nextMonthForCalendar:(NSCalendar *)calendar;
- (NSDate *)previousMonthWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)previousMonthForCalendar:(NSCalendar *)calendar;




- (NSDate *)normalizeDateByComponentFlags:(NSUInteger)flags forTimeZone:(NSTimeZone *)timeZone;

- (NSTimeInterval)timeIntervalBetweenSourceTimeZone:(NSTimeZone *)sourceTimeZone
									 targetTimeZone:(NSTimeZone *)targetTimeZone;

- (NSDate *)convertDateInTimeZone:(NSTimeZone *)sourceTimeZone toTimeZone:(NSTimeZone *)targetTimeZone;

- (NSDate *)convertDateToTimeZoneName:(NSString *)targetTimeZoneName;



@end
