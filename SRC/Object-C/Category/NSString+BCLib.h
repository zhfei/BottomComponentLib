//
//  NSString+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BCLib)
/*!
 *  @brief 宽度固定，计算字符串高度
 *  @return 返回的大小
 */
- (CGSize)stringSizeWithFixedWidth:(CGFloat)width
                              font:(UIFont *)font
                              text:(NSString *)text;
/*!
 *  @brief 高度固定，计算字符串宽度
 *  @return 返回的大小
 */
- (CGSize)stringSizeWithFixedHeight:(CGFloat)height
                               font:(UIFont *)font
                               text:(NSString *)text;

#pragma mark - 排序
- (NSString *)pinYin;
@end

NS_ASSUME_NONNULL_END
