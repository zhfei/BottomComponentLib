//
//  UIView+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BCLib)
#pragma mark - 添加核心动画
typedef UIView *(^BCAnimBlock)(CGFloat, CGFloat);

- (CABasicAnimation *)scaleAnim:(CGFloat)fromValue toValue:(CGFloat)toValue;
- (CABasicAnimation *)translAnim:(CGFloat)fromValue toValue:(CGFloat)toValue;

- (BCAnimBlock)addScaleAnim;//链式，添加核心动画
- (BCAnimBlock)addTranslAnim;
- (void)addAnimGroup:(NSArray *)animGroup;
- (void)removeScaleAnim;//删除核心动画
- (void)removeTranslAnim;
- (void)removeAnimGroup;

#pragma mark - 尺寸便捷获取
@property (nonatomic) CGFloat left;//left = frame.origin.x
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;//right = frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;

#pragma mark - 画圆角
- (void)drawCenterCircle:(CGFloat)radius color:(UIColor *)color;
- (void)addCornerAtPostion:(UIRectCorner)postion;
+ (void)drawCornerRound:(UIView *)view;
+ (void)drawCornerRound:(UIView *)view radius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
