//
//  CAShapeLayer+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "CAShapeLayer+BCLib.h"
#import <UIKit/UIKit.h>
#import "Macro.h"

@implementation CAShapeLayer (BCLib)
// !!!: 快捷创建
+ (instancetype)shapeLayer {
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
