//
//  BCRealmManager.m
//  BottomComponentLib
//
//  Created by 周飞 on 2019/1/15.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "BCRealmManager.h"
#import "BCPruduct.h"
#import "BCPerson.h"

@implementation BCRealmManager
+ (RLMRealm *)defaultRealm {
    RLMRealm *dRealm = [RLMRealm realmWithConfiguration:[self realmConfig] error:nil];
    return dRealm;
}

+ (RLMRealmConfiguration *)realmConfig {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.fileURL = [self defaultRealmURL];
    config.objectClasses = @[BCPruduct.class,BCPerson.class];
    config.readOnly = NO;
    int currentVersion = 1.0;
    config.schemaVersion = currentVersion;
    
    // 这里是设置数据迁移的block
    config.migrationBlock = ^(RLMMigration *migration , uint64_t oldSchemaVersion) {
        // enumerateObjects:block: 遍历了存储在 Realm 文件中的每一个“BCPerson”对象
        [migration enumerateObjects:BCPerson.className block:^(RLMObject *oldObject, RLMObject *newObject) {
            // 只有当 Realm 数据库的架构版本为 0 的时候，才添加 “fullName” 属性
            if (oldSchemaVersion < 1) {
                newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@", oldObject[@"firstName"], oldObject[@"lastName"]];
            }
            // 只有当 Realm 数据库的架构版本为 0 或者 1 的时候，才添加“email”属性
            if (oldSchemaVersion < 2) {
                newObject[@"email"] = @"";
            }
            // 替换属性名
            if (oldSchemaVersion < 3) { // 重命名操作应该在调用 `enumerateObjects:` 之外完成
                [migration renamePropertyForClass:BCPerson.className oldName:@"yearsSinceBirth" newName:@"age"];
            }
        }];
    };
    return config;
}

+(NSURL *)defaultRealmURL {
    NSString *directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [directory stringByAppendingPathComponent:@"DefaultRealm.realm"];
    return [NSURL fileURLWithPath:path isDirectory:YES];
}
@end
