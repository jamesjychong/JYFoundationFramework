//
//  NSDate+JYUtil.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSDate+Components.h"
#import "NSDate+Random.h"

@implementation NSDate (Random)

+ (NSDate *)randomPreviousDate
{
	NSDate *currDate = [NSDate date];
	NSDate *lastYear = [currDate dateByAddingDays:-365];
	
	return [NSDate randomDateBetweenDateA:lastYear andDateB:currDate];
}

+ (NSDate *)randomDateBetweenDateA:(NSDate *)dateA andDateB:(NSDate *)dateB
{
	NSTimeInterval timeBetweenDates = [dateB timeIntervalSinceDate:dateA];
	if (timeBetweenDates == 0)
		return dateB;
	else if (timeBetweenDates > 0)
		return [dateA dateByAddingTimeInterval:arc4random_uniform(timeBetweenDates)];
	else
		return [dateB dateByAddingTimeInterval:arc4random_uniform(-timeBetweenDates)];
}

@end
