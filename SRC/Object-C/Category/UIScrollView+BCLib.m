//
//  UIScrollView+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIScrollView+BCLib.h"

@implementation UIScrollView (BCLib)
// !!!: 内容满屏判断
- (BOOL)isOverScreen {
    return [self numOfScreen];
}

- (NSInteger)numOfScreen {
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat contextLong = self.contentSize.height;
    return contextLong/height;
}

- (NSInteger)numberOfScreen {
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat contextLong = self.contentSize.height;
    return (NSInteger)contextLong/height;
}
@end
