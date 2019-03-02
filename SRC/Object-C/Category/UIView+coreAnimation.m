//
//  UIView+coreAnimation.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/3/2.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIView+coreAnimation.h"

NSString *kAddScaleAnim = @"addScaleAnim";
NSString *kAddTranslAnim = @"addTranslAnim";
NSString *kAddAnimGroup = @"addAnimGroup";


@implementation UIView (coreAnimation)
- (CABasicAnimation *)scaleAnim:(CGFloat)fromValue toValue:(CGFloat)toValue {
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    //设置动画属性
    scaleAni.keyPath = @"transform.scale";
    
    //设置动画的起始位置。也就是动画从哪里到哪里。不指定起点，默认就从positoin开始
    scaleAni.toValue = @(toValue);
    scaleAni.fromValue = @(fromValue);

    return scaleAni;
}

- (CABasicAnimation *)translAnim:(CGFloat)fromValue toValue:(CGFloat)toValue {
    //创建动画对象
    CABasicAnimation *translationAni = [CABasicAnimation animation];
    //设置动画属性
    translationAni.keyPath = @"transform.translation.y";
    
    //设置动画的起始位置。也就是动画从哪里到哪里。不指定起点，默认就从positoin开始
    translationAni.fromValue = @(fromValue);
    translationAni.toValue = @(toValue);

    return translationAni;
}


- (BCAnimBlock)addScaleAnim {
    return ^UIView *(CGFloat fromValue, CGFloat toValue) {
        [self removeScaleAnim];
        CABasicAnimation *scaleAni = [self scaleAnim:fromValue toValue:toValue];
        [self addAnimGroup:@[scaleAni]];
        return self;
    };
}

- (BCAnimBlock)addTranslAnim {
    return ^UIView *(CGFloat fromValue, CGFloat toValue) {
        [self removeTranslAnim];
        CABasicAnimation *translAni = [self translAnim:fromValue toValue:toValue];
        [self addAnimGroup:@[translAni]];
        return self;
    };
}

- (void)addAnimGroup:(NSArray *)animGroup {
    [self removeAnimGroup];
    
    CAAnimationGroup *anGroup = [CAAnimationGroup animation];
    anGroup.animations = animGroup;
    
    /// 动画回放
    anGroup.autoreverses = YES;
    
    //动画持续时间
    anGroup.duration = 0.5;
    
    //动画重复次数
    anGroup.repeatCount = CGFLOAT_MAX;
    anGroup.removedOnCompletion = NO;
    
    [self.layer addAnimation:anGroup forKey:kAddAnimGroup];
}

- (void)removeScaleAnim {
    if ([self.layer animationForKey:kAddScaleAnim]) {
        [self.layer removeAnimationForKey:kAddScaleAnim];
    }
}
- (void)removeTranslAnim {
    if ([self.layer animationForKey:kAddTranslAnim]) {
        [self.layer removeAnimationForKey:kAddTranslAnim];
    }
}
- (void)removeAnimGroup {
    if ([self.layer animationForKey:kAddAnimGroup]) {
        [self.layer removeAnimationForKey:kAddAnimGroup];
    }
}

@end
