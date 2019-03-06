//
//  NSObject+FBRetainCycleDetector.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/3/5.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSObject+FBRetainCycleDetector.h"
#import <FBRetainCycleDetector.h>

@implementation NSObject (FBRetainCycleDetector)
- (void)checkRetainCycle {
    FBRetainCycleDetector *detector = [[FBRetainCycleDetector alloc] init];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"%@", retainCycles);
}
@end
