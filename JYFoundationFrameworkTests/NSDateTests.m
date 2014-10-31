//
//  NSDateTests.m
//  JYFoundationFramework
//
//  Created by Jae Yoon Chong on 10/31/14.
//  Copyright (c) 2014 com.jamesjychong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDate+TimeZone.h"

@interface NSDateTests : XCTestCase

@end

@implementation NSDateTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSameMonthP01 {
	// Positive #01
	// [NSDate isSameMonth]
	// Compare with the same date
	NSDate *date = [NSDate date];
	XCTAssert([date isSameMonth:date], @"Pass");
}

- (void)testSameMonthP02 {
	// Positive #01
	// [NSDate isSameMonth]
	// Compare with the same date
	NSDate *date = [NSDate date];
	XCTAssert([date isSameMonth:date], @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
