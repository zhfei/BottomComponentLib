//
//  NSObject+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BCLib)
#pragma mark - 循环引用检测
- (void)checkRetainCycle;

#pragma mark - runtime方法
- (NSArray *)getAllIvars;
- (NSArray *)getAllMethods;

@end

NS_ASSUME_NONNULL_END
