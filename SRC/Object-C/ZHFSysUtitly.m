//
//  ZHFSysUtitly.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/5/9.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "ZHFSysUtitly.h"
#import <mach/mach.h>

static ZHFSysUtitly *_sysUtitly;

@implementation ZHFSysUtitly
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sysUtitly = [super allocWithZone:zone];
    });
    return _sysUtitly;
}

+ (instancetype)sharedSysUtitly {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sysUtitly = [[self alloc] init];
    });
    return _sysUtitly;
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return _sysUtitly;
}

#pragma mark - Tools
- (int64_t)memoryUsage {
    int64_t memoryUsageInByte = 0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if(kernelReturn == KERN_SUCCESS) {
        memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
        NSLog(@"Memory in use (in bytes): %lld", memoryUsageInByte);
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kernelReturn));
    }
    return memoryUsageInByte;
}



@end
