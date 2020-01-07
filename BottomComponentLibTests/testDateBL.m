//
//  testDateBL.m
//  BottomComponentLibTests
//
//  Created by zhoufei on 2020/1/7.
//  Copyright © 2020 zhoufei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+BCLib.h"
#import "NSDateFormatter+BCLib.h"

@interface testDateBL : XCTestCase

@end

@implementation testDateBL

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testRangeDay {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *originalDate = @"2019-10-07 10:19:30";
    NSDate *date = [[NSDateFormatter defaultDateFormatter] dateFromString:originalDate];

    [NSDate rangeDay:date complete:^(NSString * _Nonnull startTime, NSString * _Nonnull endTime) {
        NSString *resultStartTime = @"2019-10-07 00:00:00";
        NSString *resultEndTime = @"2019-10-07 23:59:59";
        XCTAssertEqualObjects(startTime, resultStartTime,@"失败");
        XCTAssertEqualObjects(endTime, resultEndTime,@"失败");
    }];
}

- (void)testRangeMonth {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *originalDate = @"2019-10-07 10:19:30";
    NSDate *date = [[NSDateFormatter defaultDateFormatter] dateFromString:originalDate];

    [NSDate rangeMonth:date complete:^(NSString * _Nonnull startTime, NSString * _Nonnull endTime) {
        NSString *resultStartTime = @"2019-10-01 00:00:00";
        NSString *resultEndTime = @"2019-10-31 23:59:59";
        XCTAssertEqualObjects(startTime, resultStartTime,@"失败");
        XCTAssertEqualObjects(endTime, resultEndTime,@"失败");
    }];
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSString *origalDate = @"2019-10-07 10:19:30";
        CFTimeInterval startTime = CACurrentMediaTime();
        
        NSDate *date = [[NSDateFormatter defaultDateFormatter] dateFromString:origalDate];
        
        NSLog(@"%f",CACurrentMediaTime()-startTime);
        XCTAssertNotNil(date,@"错误");
    }];
}

@end
