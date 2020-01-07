//
//  BCPersistenceSQL.m
//  BottomComponentLib
//
//  Created by 周飞 on 2018/11/5.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "BCPersistenceSQL.h"
#import <FMDB/FMDB.h>

//数据库名
#define LOCAL_CACHE_DATABASE  @"LOCAL_CACHE_DATABASE"
//数据表名
static NSString *cache_table_name = @"PersistenceSQL";

@implementation BCPersistenceSQL
SingletonM(BCPersistenceSQL)
@synthesize path;

- (instancetype)init
{
    self = [super init];
    if (self) {
        FMDatabase *database = [self openLocalDatabase];
        if ([database open]) {
            NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (id INTEGER PRIMARY KEY AUTOINCREMENT,cache_data blob NOT NULL,cache_key text NOT NULL)", cache_table_name];
            BOOL isSuccess = [database executeUpdate:sql];
            if (isSuccess) {
                NSLog(@"create %@ success", cache_table_name);
            }else{
                NSLog(@"create %@ failed", cache_table_name);
            }
            [database close];
        }
    }
    return self;
}

- (FMDatabase *)openLocalDatabase{
    NSString *databasePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString: [NSString stringWithFormat:@"/%@.db",  LOCAL_CACHE_DATABASE ]];
    NSLog(@"cache directory---%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]);
    return [FMDatabase databaseWithPath:databasePath];
}

#pragma mark - 功能实现
- (void)saveData {
    
}

/**
 selectCache
 
 @param cacheKey cacheKey
 @param cache_table_name cache_table_name
 @return cache
 */
- (id)selectCacheItemWithCacheKey:(NSString *)cacheKey andCacheTableName:(NSString *)cache_table_name{
    
    FMDatabase *database = [self openLocalDatabase];
    BOOL isOpen = [database open];
    if (isOpen) {
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE cache_key = %@",  cache_table_name, cacheKey];
        FMResultSet *resultSet = [database executeQuery:sql];
        while([resultSet next]) {
            NSData *data = [resultSet dataForColumn:@"cache_data"];
            id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            return obj;
        }
        [database close];
    }
    return nil;
}


/**
 selectAllCache
 
 @param cache_table_name cache_table_name
 @return AllCache
 */
- (NSArray *)selectAllCacheItemWithCacheTableName:(NSString *)cache_table_name{
    FMDatabase *database = [self openLocalDatabase];
    NSMutableArray *arr = [NSMutableArray array];
    BOOL isOpen = [database open];
    if (isOpen) {
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@", cache_table_name];
        FMResultSet *resultSet = [database executeQuery:sql];
        while([resultSet next]) {
            NSData *data = [resultSet objectForColumn:@"cache_data"];
            NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [arr addObject:dic];
        }
        [database close];
        return arr;
    }
    return nil;
}


/**
 clearAllCacheTable
 */
- (void)clearAllCacheTableWithCacheTableName:(NSString *)cache_table_name{
    FMDatabase *database = [self openLocalDatabase];
    BOOL isOpen = [database open];
    if (isOpen) {
        NSString *sql = [NSString stringWithFormat:@"DELETE FROM '%@'", cache_table_name];
        BOOL result = [database executeUpdate:sql];
        if (result) {
            NSLog(@"---------------");
            NSLog(@" insert success");
            NSLog(@"---------------");
        }else{
            NSLog(@"-------------");
            NSLog(@" insert faild");
            NSLog(@"-------------");
        }
    }
    [database close];
}


@end
