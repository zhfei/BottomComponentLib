//
//  NSObject+Runtime.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/1/22.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Runtime)
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
