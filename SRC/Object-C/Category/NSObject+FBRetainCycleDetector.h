//
//  NSObject+FBRetainCycleDetector.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/3/5.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FBRetainCycleDetector)
- (void)checkRetainCycle;
@end

NS_ASSUME_NONNULL_END
