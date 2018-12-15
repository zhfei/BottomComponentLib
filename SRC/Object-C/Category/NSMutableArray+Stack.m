//
//  NSMutableArray+Stack.m
//  BottomComponentLib
//
//  Created by 周飞 on 2018/12/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)
- (void)push:(id)obj {
    [self addObject:obj];
}
- (id)pop {
    id obj = [self lastObject];
    [self removeLastObject];
    return obj;
}
@end
