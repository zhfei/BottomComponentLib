//
//  NSDecimalNumber+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (BCLib)
//加
- (NSDecimalNumber *)bc_Add:(id)number;
//减
- (NSDecimalNumber *)bc_Subtract:(id)number;
//乘
- (NSDecimalNumber *)bc_Multiply:(id)number;
//除
- (NSDecimalNumber *)bc_Divide:(id)number;
@end

NS_ASSUME_NONNULL_END
