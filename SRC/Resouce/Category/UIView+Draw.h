//
//  UIView+Draw.h
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/6.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Draw)
- (void)drawCenterCircle:(CGFloat)radius color:(UIColor *)color;

- (void)addCornerAtPostion:(UIRectCorner)postion;
@end
