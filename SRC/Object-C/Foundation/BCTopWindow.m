//
//  BCTopWindow.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/11.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "BCTopWindow.h"

@implementation BCTopWindow
SingletonM(BCTopWindow)
- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.windowLevel = NSUIntegerMax;
        self.rootViewController = [UIViewController new];
        [self makeKeyAndVisible];
        [self setHidden:YES];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
@end
