//
//  UIFactory.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/1/28.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory
+ (UILabel *)labelFactory:(NSString *)text {
    UILabel *label = [UILabel new];
    label.text = text;
    label.numberOfLines = 0;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    return label;
}

+ (UIImageView *)imageViewFactory:(NSString *)imageName {
    UIImageView *imageV = [UIImageView new];
    imageV.image = [UIImage imageNamed:imageName];
    imageV.contentMode = UIViewContentModeCenter;
    return imageV;
}

+ (UIButton *)buttonFactory:(NSString *)text {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 100, 50)];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    return btn;
}

@end
