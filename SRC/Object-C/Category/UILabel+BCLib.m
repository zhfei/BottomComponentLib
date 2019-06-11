//
//  UILabel+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UILabel+BCLib.h"

@implementation UILabel (BCLib)
+ (instancetype)labelWithFrame:(CGRect)frame title:(NSString *)title {
    UILabel *label=[[UILabel alloc]init];
    label.textAlignment=NSTextAlignmentCenter;
    label.text = title;
    label.frame = frame;
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:12.f];
    [label setBackgroundColor:[UIColor whiteColor]];
    return label;
}
@end
