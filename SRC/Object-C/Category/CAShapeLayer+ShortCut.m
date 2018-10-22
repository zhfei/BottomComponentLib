//
//  CAShapeLayer+ShortCut.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "CAShapeLayer+ShortCut.h"
#import <UIKit/UIKit.h>
#import "Macro.h"

@implementation CAShapeLayer (ShortCut)
+ (instancetype)shortCutShapeLayer {
    CAShapeLayer * layer  = [CAShapeLayer layer];
    layer.backgroundColor = WhiteColor.CGColor;
    layer.fillColor       = WhiteColor.CGColor;
    layer.lineCap         = kCALineCapRound;
    layer.lineJoin        = kCALineJoinRound;
    layer.strokeColor     = WhiteColor.CGColor;
    layer.lineWidth       = 2;
    return layer;
}
@end
