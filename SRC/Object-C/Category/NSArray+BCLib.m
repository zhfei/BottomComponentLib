//
//  NSArray+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSArray+BCLib.h"
#import "NSString+BCLib.h"

@implementation NSArray (BCLib)
+ (NSArray<NSString *>*)sortByFirstLetter:(NSArray<NSString *> *)sourceArray ascending:(BOOL)asc {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:asc];
    return [sourceArray sortedArrayUsingDescriptors:@[descriptor]];
}
@end
