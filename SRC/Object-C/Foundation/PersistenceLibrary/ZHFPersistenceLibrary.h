//
//  ZHFPersistenceLibrary.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/11/5.
//  Copyright © 2018年 zhoufei. All rights reserved.
//
// 持久库：
// 持久方案：NSUserDefaults、Plist、归档、数据库（Realm、MySQL）

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHFPersistenceLibrary : NSObject
//存储到：偏好设置
+ (void)saveDataToUserDefault;
//存储到：Plist
+ (void)saveDataToPlist;
//归档存储
+ (void)saveDataByCoding;
//存储到：Realm
+ (void)saveDataToRealm;
//存储到：MySQL
+ (void)saveDataToMySQL;

+ (void)saveData;

@end

NS_ASSUME_NONNULL_END
