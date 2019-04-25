//
//  UIScrollView+ShortCut.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/4/25.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIScrollView+ShortCut.h"

@implementation UIScrollView (ShortCut)
- (BOOL)isOverScreen {
    return [self numOfScreen];
}

- (NSInteger)numOfScreen {
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat contextLong = self.contentSize.height;
    return contextLong/height;
}
@end
