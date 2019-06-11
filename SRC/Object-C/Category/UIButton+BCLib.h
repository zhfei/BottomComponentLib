//
//  UIButton+BCLib.h
//  BottomComponentLib
//
//  Created by zhoufei on 2019/6/11.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TapBlock)(UIButton *btn);

@interface UIButton (BCLib)
+ (instancetype)shortCutButtonWithFrame:(CGRect)frame title:(NSString *)title TapAction:(TapBlock)tapBlock;
/**
 上下垂直居中
 */
- (void)verticalImageAndTitle;
@end

NS_ASSUME_NONNULL_END
