//
//  UIColor+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct RGBValue {
    CGFloat r;
    CGFloat g;
    CGFloat b;
}RGBValueType;

@interface UIColor (BCLib)
/**
 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
 
 @param hex 十六进制字符串
 @param alpha alpha
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;

+ (RGBValueType)rgbValueWithHexString:(NSString *)hex;

/**
 color转换成十六进制字符串
 
 @param color 颜色
 @return 十六进制字符串
 */
+ (NSString *)hexStringFromColor:(UIColor *)color;

/**
 生成随机颜色
 @return 随机颜色
 */
+ (UIColor *)randomColor;
@end

NS_ASSUME_NONNULL_END
