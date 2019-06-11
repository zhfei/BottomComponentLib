//
//  UILabel+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (BCLib)
#pragma mark - 快捷创建
+ (instancetype)labelWithFrame:(CGRect)frame title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
