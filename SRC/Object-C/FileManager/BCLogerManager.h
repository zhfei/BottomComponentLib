//
//  BCLogerManager.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/10/23.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Macro.h"

NS_ASSUME_NONNULL_BEGIN

#define APP_Version @"0.0.1"

typedef NS_ENUM(NSInteger, BCLogger_level) {
    BC_Level_Debug,
    BC_Level_Warn,
    BC_Level_Error
};

typedef NS_ENUM(NSInteger, BCLogger_tag) {
    BC_Tag_default = 1 << 0,
    BC_Tag_event  = 1 << 1,
    BC_Tag_verbose  = 1 << 2
};

@interface BCLogerManager : NSObject
SingletonH(BCLogerManager)

@property (nonatomic, assign)BCLogger_level BC_LOG_LEVEL_LIMIT;

+ (void)log:(NSString *)message level:(BCLogger_level)level tag:(BCLogger_tag)tag;
@end

NS_ASSUME_NONNULL_END
