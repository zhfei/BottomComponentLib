//
//  UIFactory.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/1/28.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFactory : NSObject
+ (UILabel *)labelFactory:(NSString *)text;
+ (UIImageView *)imageViewFactory:(NSString *)imageName;
+ (UIButton *)buttonFactory:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
