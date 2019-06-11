//
//  NSObject+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSObject+BCLib.h"
#import <FBRetainCycleDetector.h>
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (BCLib)
// !!!: 循环引用检测
- (void)checkRetainCycle {
    FBRetainCycleDetector *detector = [[FBRetainCycleDetector alloc] init];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"%@", retainCycles);
}

// !!!: runtime方法
- (NSArray *)getAllIvars {
    unsigned int count;
    Class class = [self class];
    
    Ivar *ivar = class_copyIvarList(class, &count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        char * ivarName = ivar_getName(ivar[i]);
        NSString *name = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        [arrayM addObject:name];
    }
    return arrayM.mutableCopy;
}

- (NSArray *)getAllMethods {
    unsigned int count;
    Class class = [self class];
    
    Method *method = class_copyMethodList(class, &count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        char * methodName = method_getName(method[i]);
        NSString *name = [NSString stringWithCString:methodName encoding:NSUTF8StringEncoding];
        [arrayM addObject:name];
    }
    return arrayM.mutableCopy;
}

@end
