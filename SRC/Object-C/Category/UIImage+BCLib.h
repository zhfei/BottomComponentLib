//
//  UIImage+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BCLib)
#pragma mark - 图片处理
/**
 根据颜色生成一个纯色图片
 @param color 颜色
 @return 纯色图片
 */
+ (UIImage *)pureImageWithColor:(UIColor *)color;
/**
 生成一个截图
 @param view 要截图的view
 @return 截图
 */
+ (UIImage *)screenshotInView:(UIView *)view;
/**
 在图片上加另一个图片作为水印
 */
+ (UIImage *)waterMarkInImage:(UIImage *)image waterImage:(UIImage *)waterImage point:(CGPoint)point scale:(CGFloat)scale;
/**
 在图片上添加圆角
 */
+ (UIImage *)roundedCornerImage:(UIImage *)image;
/**
 对图片进行缩放
 */
+ (UIImage *)scaleImage:(UIImage *)image scale:(CGFloat)scale;

+ (NSData *)scaleImage2Data:(UIImage *)image scale:(CGFloat)scale ;

@end

NS_ASSUME_NONNULL_END
