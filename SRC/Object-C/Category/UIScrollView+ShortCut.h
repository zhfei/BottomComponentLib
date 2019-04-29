//
//  UIScrollView+ShortCut.h
//  BottomComponentLib
//
//  Created by 周飞 on 2019/4/25.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end

NS_ASSUME_NONNULL_END
