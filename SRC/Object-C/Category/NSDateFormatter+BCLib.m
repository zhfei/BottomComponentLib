//
//  NSDateFormatter+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSDateFormatter+BCLib.h"

static NSDateFormatter *_dateFormatter;
static NSString *defaultFormatterStr = @"yyyy-MM-dd HH:mm:ss";

@implementation NSDateFormatter (BCLib)
+ (void)initialize {
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:defaultFormatterStr];
}

+ (NSString *)defaultFormatterStr {
    return defaultFormatterStr;
}

+ (NSDateFormatter *)defaultDateFormatter {
    return _dateFormatter;
}

@end
