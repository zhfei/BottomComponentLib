//
//  UIView+coreAnimation.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/3/2.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIView *(^BCAnimBlock)(CGFloat, CGFloat);

@interface UIView (coreAnimation)
- (CABasicAnimation *)scaleAnim:(CGFloat)fromValue toValue:(CGFloat)toValue;
- (CABasicAnimation *)translAnim:(CGFloat)fromValue toValue:(CGFloat)toValue;

//链式，添加核心动画
- (BCAnimBlock)addScaleAnim;
- (BCAnimBlock)addTranslAnim;
- (void)addAnimGroup:(NSArray *)animGroup;
//删除核心动画
- (void)removeScaleAnim;
- (void)removeTranslAnim;
- (void)removeAnimGroup;
@end

NS_ASSUME_NONNULL_END
