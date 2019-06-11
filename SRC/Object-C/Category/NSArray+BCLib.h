//
//  NSArray+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (BCLib)
+ (NSArray<NSString *>*)sortByFirstLetter:(NSArray<NSString *> *)sourceArray ascending:(BOOL)asc;
@end

NS_ASSUME_NONNULL_END
