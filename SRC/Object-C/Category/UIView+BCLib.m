//
//  UIView+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIView+BCLib.h"

@implementation UIView (BCLib)
// !!!: 添加核心动画
NSString *kAddScaleAnim = @"addScaleAnim";
NSString *kAddTranslAnim = @"addTranslAnim";
NSString *kAddAnimGroup = @"addAnimGroup";

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

// !!!: 尺寸便捷获取
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

// !!!: 画圆角
- (void)drawCenterCircle:(CGFloat)radius color:(UIColor *)color {
    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = bezier.CGPath;    shape.fillColor = color.CGColor;
    shape.frame = self.bounds;
    [self.layer insertSublayer:shape atIndex:0];
}

- (void)addCornerAtPostion:(UIRectCorner)postion{
    CGFloat radius = 6.f;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:postion cornerRadii:CGSizeMake(radius,radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
    [self.layer setMasksToBounds:YES];
}

+ (void)drawCornerRound:(UIView *)view {
    [self drawCornerRound:view radius:5 borderColor:[UIColor whiteColor]  borderWidth:0];
}

+ (void)drawCornerRound:(UIView *)view radius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    view.layer.cornerRadius = radius;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = color.CGColor;
    view.layer.masksToBounds = YES;
}

@end
