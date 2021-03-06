//
//  BCSysUtitly.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/5/9.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BCSysUtitly : NSObject
/**
 查询app占用内存大小,使用物理内存，而不是使用寄主内存大小
 @return 内存大小
 */
- (int64_t)memoryUsage;
@end

NS_ASSUME_NONNULL_END
