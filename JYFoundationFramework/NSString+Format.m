//
//  NSString+Format.m
//  JYFoundationFramework
//
//  Created by James Chong
//  Copyright (c) 2014 jamesjychong. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

+ (NSString *)stringShortenWithInteger:(NSInteger)integer
{
	// TODO: [JY]
	// http://stackoverflow.com/questions/11993806/convert-int-to-shortened-formatted-string
	
	//value = 32600001llu;
	//value = UINT64_MAX;
	
	NSUInteger index = 0;
	double dvalue = (double)integer;
	//Updated to use correct SI Symbol ( http://en.wikipedia.org/wiki/SI_prefix )
	NSArray *suffix = @[ @"", @"k", @"M", @"G", @"T", @"P", @"E" ];
	
	while ((integer/=1000) && ++index) dvalue /= 1000;
	
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setLocale:[NSLocale currentLocale]];
	
	//Set fractional digits to 0 or 1
	[formatter setMaximumFractionDigits:(int)(dvalue < 100.0 && ((unsigned)((dvalue - (unsigned)dvalue) * 10) > 0))];
	
	NSString *svalue = [[formatter stringFromNumber:[NSNumber numberWithFloat:dvalue]]
						stringByAppendingString:[suffix objectAtIndex:index]];
	
	return svalue;
}

- (BOOL)isValidEmailAddress
{
	static NSString *regexForEmailAddress = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexForEmailAddress];
	
	return [emailValidation evaluateWithObject:self];
}

@end
