//
//  UIScrollView+ShortCut.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/4/25.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ShortCut)
- (BOOL)isOverScreen;
- (NSInteger)numOfScreen;
@end

NS_ASSUME_NONNULL_END
