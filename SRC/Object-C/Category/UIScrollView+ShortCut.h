//
//  UIScrollView+ShortCut.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/4/25.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"

@protocol BCShortCutProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ShortCut)
//定义IBOutlet属性
@property (nonatomic, weak) IBOutlet id<BCShortCutProtocol> shortCutDelegate;

- (BOOL)isOverScreen;
- (NSInteger)numOfScreen;
@end


//定义协议
@protocol BCShortCutProtocol <NSObject>
//methodA将要丢弃，请使用methodB方法
- (void)methodA MethodDeprecated(-methodB);
- (void)methodB ;


@end

NS_ASSUME_NONNULL_END
