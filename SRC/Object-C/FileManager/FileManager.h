//
//  FileManager.h
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/6.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
//返回根目录路径 "document"
+ (NSString *)documentPath;
//返回 "document/dir/" 文件夹路径,没有则创建
+ (NSString*)getDirectoryForDocuments:(NSString*) dir;
//返回 "document/filename" 路径,没有则创建
+ (NSString*)getFilePathForDocuments:(NSString*)filename;
//创建目录路径
+ (BOOL)createDir:(NSString *)dirPath;
//存数据
+ (void)saveObjet:(NSDictionary *)dict toPath:(NSString *)path;
//存数据
+ (void)saveData:(NSData *)data toPath:(NSString *)path;
//读数据
+ (id)readObjetFromPath:(NSString *)path;
+ (NSArray *)readObjetsFromPath:(NSString *)path;
@end
