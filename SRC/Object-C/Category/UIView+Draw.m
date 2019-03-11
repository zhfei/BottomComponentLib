//
//  UIView+Draw.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/6.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "UIView+Draw.h"

@implementation UIView (Draw)
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
