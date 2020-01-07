//
//  GlobalConfig.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/6.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "BCGlobalConfig.h"
//#import <YYModel/YYModel.h>
#import <NSObject+YYModel.h>
#import "BCFileManager.h"

#if DEBUG
NSString *const Domain = @"https:www.baidu.com";
#else
NSString *const Domain = @"http://7xqkjm.com1.z0.glb.clouddn.com";
#endif



@implementation BCGlobalConfig
SingletonM(GlobalConfig)
- (instancetype)init
{
    self = [super init];
    if (self) {
        [BCFileManager createDir:kConfigPath];
        NSDictionary *dict = [self readConfig];
        if (!dict) {
            self.lineWidth = 2;
            self.lineColorHex = @"#000000";
            [self saveConfig];
        } else {
            [self setup:dict];
        }
    }
    return self;
}

- (void)setup:(NSDictionary *)dict {
    self.lineColorHex = dict[@"lineColorHex"];
    self.lineWidth = [dict[@"lineWidth"] floatValue];
}

- (void)saveConfig {
    id dict = [self yy_modelToJSONObject];
    
    [BCFileManager saveObjet:dict toPath:[kConfigPath stringByAppendingPathComponent:@"config.plist"]];
}
- (NSDictionary *)readConfig {
    NSDictionary *dict = [BCFileManager readObjetFromPath:[kConfigPath stringByAppendingPathComponent:@"config.plist"]];
    return dict;
}
@end
