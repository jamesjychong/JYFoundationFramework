//
//  UIColorTests.m
//  JYFoundationFramework
//
//  Created by Jae Yoon Chong on 10/31/14.
//  Copyright (c) 2014 com.jamesjychong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UIColor+Initializer.h"

@interface UIColorTests : XCTestCase

@end

@implementation UIColorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColorHexP01 {
	UIColor *colorFromHex3 = [UIColor colorWithHexString:@"#fff"];
	
	CGFloat r, g, b, a;
	[colorFromHex3 getRed:&r green:&g blue:&b alpha:&a];

	XCTAssert(r == 0, @"Pass");
	XCTAssert(g == 0, @"Pass");
	XCTAssert(b == 0, @"Pass");
	XCTAssert(a == 0, @"Pass");
	
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
