//
//  NSDate+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSDate+BCLib.h"
#import "NSDateFormatter+BCLib.h"

@implementation NSDate (BCLib)
+ (NSDate *)currentDate {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    NSDate *correctDate = [NSDate dateWithTimeIntervalSince1970:interval];
    return correctDate;
}

+ (NSString *)defaultFormatDate {
    NSDate *date = [self currentDate];
    return [[NSDateFormatter defaultDateFormatter] stringFromDate:date];
}
@end
