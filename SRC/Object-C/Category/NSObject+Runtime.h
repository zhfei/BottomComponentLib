//
//  NSObject+Runtime.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/1/22.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime)
- (NSArray *)getAllIvars;
- (NSArray *)getAllMethods;
@end

NS_ASSUME_NONNULL_END
