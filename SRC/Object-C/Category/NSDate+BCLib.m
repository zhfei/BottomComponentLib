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

+ (void)rangeDay:(NSDate *)originalDate complete:(void(^)(NSString *startTime, NSString *endTime))block {
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    comp.year = [[calendar components:NSCalendarUnitYear fromDate:originalDate] year];
    comp.month = [[calendar components:NSCalendarUnitMonth fromDate:originalDate] month];
    comp.day = [[calendar components:NSCalendarUnitDay fromDate:originalDate] day];
    comp.hour = 0;
    comp.minute = 0;
    comp.second = 0;
    NSDate *startDate = [calendar dateFromComponents:comp];
    
    comp.hour = 23;
    comp.minute = 59;
    comp.second = 59;
    NSDate *endDate = [calendar dateFromComponents:comp];
    
    NSString *startStr = [[NSDateFormatter defaultDateFormatter] stringFromDate:startDate];
    NSString *endStr = [[NSDateFormatter defaultDateFormatter] stringFromDate:endDate];
    if (block) {
        block(startStr,endStr);
    }
}

+ (void)rangeMonth:(NSDate *)originalDate complete:(void(^)(NSString *startTime, NSString *endTime))block {

    NSDateComponents *comp = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    comp.year = [[calendar components:NSCalendarUnitYear fromDate:originalDate] year];
    comp.month = [[calendar components:NSCalendarUnitMonth fromDate:originalDate] month];
    comp.day = 1;
    comp.hour = 0;
    comp.minute = 0;
    comp.second = 0;
    NSDate *startDate = [calendar dateFromComponents:comp];
    
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:originalDate];
    comp.day = dayRange.length;
    comp.hour = 23;
    comp.minute = 59;
    comp.second = 59;
    NSDate *endDate = [calendar dateFromComponents:comp];
    
    NSString *startStr = [[NSDateFormatter defaultDateFormatter] stringFromDate:startDate];
    NSString *endStr = [[NSDateFormatter defaultDateFormatter] stringFromDate:endDate];
    if (block) {
        block(startStr,endStr);
    }
}



@end
