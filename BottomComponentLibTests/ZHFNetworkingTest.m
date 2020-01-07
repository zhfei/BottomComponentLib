//
//  ZHFNetworkingTest.m
//  BottomComponentLibTests
//
//  Created by zhoufei on 2020/1/7.
//  Copyright © 2020 zhoufei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZHFRequestParameter.h"
#import "ZHFNetworking.h"

@interface ZHFNetworkingTest : XCTestCase

@end

@implementation ZHFNetworkingTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testRequestParameter {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    ZHFRequestParameter *req = [[ZHFRequestParameter alloc] init];
    
    
}

- (void)testAsyncRequest {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
