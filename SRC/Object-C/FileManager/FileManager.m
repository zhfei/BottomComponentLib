//
//  FileManager.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/6.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
+ (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString *)getDirectoryForDocuments:(NSString*) dir
{
    NSString* dirPath = [[self documentPath] stringByAppendingPathComponent:dir];
    [self createDir:dirPath];
    return dirPath;
}

+ (NSString*)getFilePathForDocuments:(NSString*)filename
{
    return [[self documentPath] stringByAppendingPathComponent:filename];
}

+ (void)saveObjet:(NSDictionary *)dict toPath:(NSString *)path {
    if ([self createDir:path]) {
        [dict writeToFile:path atomically:YES];
    }
}

//存数据
+ (void)saveData:(NSData *)data toPath:(NSString *)path {
    [data writeToFile:path atomically:YES];
}

+ (id)readObjetFromPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return nil;
}

+ (NSArray *)readObjetsFromPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
        return contents;
    }
    return nil;
}

+ (BOOL)deleteFilesRecursion:(NSString *)path {
    //1.判断时文件还是目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExit = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if (isExit) {
        if (isDir) {
            NSArray *fileArray = [fileManager contentsOfDirectoryAtPath:path error:nil];
            for (NSString *subPath in fileArray) {
                NSString *path1 = [path stringByAppendingPathComponent:subPath];
                [self deleteFilesRecursion:path1];
            }
            
        } else {
            NSLog(@"删除文件:%@",path);
            [fileManager removeItemAtPath:path error:nil];
        }
    } else {
        NSLog(@"删除的是目录或者不存在:%@",path);
    }
    
    return YES;
}

+ (BOOL)createDir:(NSString *)dirPath
{
    BOOL creatingSuccess = NO;
    
    BOOL isDir = NO;
    //判断文件是否存在，判断路径是否为目录
    BOOL isCreated = [[NSFileManager defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( isCreated == NO || isDir == NO )
    {
        NSError* error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success == NO) {
            NSLog(@"create dir error: %@",error.debugDescription);
        } else {
            creatingSuccess = YES;
        }
    }
    return creatingSuccess;
}
@end
