//
//  NSDate+Random.h
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

@interface NSDate (Random)

/**
 * Returns randomly selected date before current date
 *
 * @return	randomly selected date before current date
 */
+ (NSDate *)randomPreviousDate;

/**
 * Returns randomly selected date between dateA and dateB
 *
 * @param	dateA		first date in a range
 * @param	dateB		second date in a range
 * @return	any date between dateA and date B
 */
+ (NSDate *)randomDateBetweenDateA:(NSDate *)dateA andDateB:(NSDate *)dateB;

@end
