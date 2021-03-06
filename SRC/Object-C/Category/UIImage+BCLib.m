//
//  UIImage+BCLib.m
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "UIImage+BCLib.h"

@implementation UIImage (BCLib)
// !!!: 图片处理
+ (UIImage *)pureImageWithColor:(UIColor *)color {
    CGRect rect = (CGRect){CGPointZero, (CGSize){1,1}};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)screenshotInView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(UIScreen.mainScreen.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)waterMarkInImage:(UIImage *)image waterImage:(UIImage *)waterImage point:(CGPoint)point scale:(CGFloat)scale{
    NSAssert(image, @"原始图片为空");
    NSAssert(waterImage, @"水印图片为空");
    
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    
    //1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, imageW, imageH)];
    
    CGFloat waterW = waterImage.size.width;
    CGFloat WaterH = waterImage.size.height;
    
    CGFloat cW = waterW * scale;
    CGFloat cH = WaterH * scale;
    CGFloat cX = (imageW - cW)/point.x;
    CGFloat cY = (imageH - cH)/point.y;
    
    [waterImage drawInRect:CGRectMake(cX, cY, cW, cH)];
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
    
}

+ (UIImage *)roundedCornerImage:(UIImage *)image {
    CGSize size = image.size;
    CGFloat radius = size.width > size.height ? size.height : size.width;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    //    UIGraphicsBeginImageContext(size);
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius] addClip];
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

+ (UIImage *)scaleImage:(UIImage *)image scale:(CGFloat)scale {
    //    NSData *data = UIImageJPEGRepresentation(image, scale);
    NSData *data = UIImagePNGRepresentation(image);
    UIImage *result = [UIImage imageWithData:data scale:scale];
    return result;
}

+ (NSData *)scaleImage2Data:(UIImage *)image scale:(CGFloat)scale {
    NSData *data = UIImageJPEGRepresentation(image, scale);
    return data;
}


@end
