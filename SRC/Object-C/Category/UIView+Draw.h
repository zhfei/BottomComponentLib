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
//画圆角
+ (void)drawCornerRound:(UIView *)view;
+ (void)drawCornerRound:(UIView *)view radius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

@end
