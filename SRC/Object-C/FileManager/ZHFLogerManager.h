//
//  ZHFLogerManager.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/10/23.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Macro.h"

NS_ASSUME_NONNULL_BEGIN

#define APP_Version @"0.0.1"

typedef NS_ENUM(NSInteger, ZHFLogger_level) {
    ZHF_Level_Debug,
    ZHF_Level_Warn,
    ZHF_Level_Error
};

typedef NS_ENUM(NSInteger, ZHFLogger_tag) {
    ZHF_Tag_default = 1 << 0,
    ZHF_Tag_event  = 1 << 1,
    ZHF_Tag_verbose  = 1 << 2
};

@interface ZHFLogerManager : NSObject
SingletonH(ZHFLogerManager)

@property (nonatomic, assign)ZHFLogger_level ZHF_LOG_LEVEL_LIMIT;

+ (void)log:(NSString *)message level:(ZHFLogger_level)level tag:(ZHFLogger_tag)tag;
@end

NS_ASSUME_NONNULL_END
