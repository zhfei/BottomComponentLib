//
//  UIScrollView+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMacro.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (BCLib)
#pragma mark - 内容满屏判断
- (BOOL)isOverScreen;
- (NSInteger)numOfScreen MethodDeprecated(numberOfScreen);
- (NSInteger)numberOfScreen;
@end

NS_ASSUME_NONNULL_END
