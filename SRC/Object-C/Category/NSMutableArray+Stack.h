//
//  NSMutableArray+Stack.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/12/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)
- (void)push:(id)obj;
- (id)pop;
- (id)dropBottom;
@end

NS_ASSUME_NONNULL_END
