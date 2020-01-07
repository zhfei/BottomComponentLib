//
//  NSDate+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (BCLib)
+ (NSDate *)currentDate;
+ (NSString *)defaultFormatDate;
/**
 处理一天内的最大范围
 @param originalDate 原始时间
 @param block 天内的时、分、秒范围
 */
+ (void)rangeDay:(NSDate *)originalDate complete:(void(^)(NSString *startTime, NSString *endTime))block;
/**
 处理一月内的最大范围
 @param originalDate 原始时间
 @param block 月内的天、时、分、秒范围
 */
+ (void)rangeMonth:(NSDate *)originalDate complete:(void(^)(NSString *startTime, NSString *endTime))block;

@end

NS_ASSUME_NONNULL_END
