//
//  ZHFLogerManager.m
//  BottomComponentLib
//
//  Created by 周飞 on 2018/10/23.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "ZHFLogerManager.h"
#import <YYKit/UIApplication+YYAdd.h>

static NSString *KAppName;

@implementation ZHFLogerManager
{
    NSString *_logPath;
    dispatch_queue_t _writeQueue;
    NSInteger _verboseMesageSaveStep;
    NSInteger _verboseMesageCount;
    NSFileHandle *_fileHandle;
}

SingletonM(ZHFLogerManager)
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ZHF_LOG_LEVEL_LIMIT = ZHF_Level_Warn;
        KAppName = [UIApplication sharedApplication].appBundleName;
        
        //创建日志目录，及日志文件
        NSString *tmpDirectory = NSTemporaryDirectory();
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8 * 3600]];
        [dateFormatter setDateFormat:@"yyyyMMdd-HHmmss"];
        NSString *filename = [NSString stringWithFormat:@"%@.txt", [dateFormatter stringFromDate:now]];
        _logPath = [tmpDirectory stringByAppendingPathComponent:@"/ZHFLogger/"];
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:_logPath]) {
            //            NSLog(@"createDirectoryAtPath _logPath %@ ", _logPath);
            
            [[NSFileManager defaultManager] createDirectoryAtPath:_logPath
                                      withIntermediateDirectories:NO
                                                       attributes:nil
                                                            error:nil];
            
        } else {
            NSError * error;
            NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_logPath
                                                                                              error:&error];
            //删除旧日志. 仅保留最近三天日志
            for (NSString *fileItem in directoryContents) {
                NSString *fileItemName = fileItem.lastPathComponent;
                //                NSLog(@"directoryContents  %@  %ld", fileItemName, (long)[fileItemName integerValue]);
                if ([filename integerValue] - [fileItemName integerValue] > 3) {
                    NSString *pathToRemove =  [_logPath stringByAppendingPathComponent:fileItemName];
                    [[NSFileManager defaultManager] removeItemAtPath:pathToRemove error:nil];
                }
            }
        }
        
        _logPath = [_logPath stringByAppendingPathComponent:filename];
        _writeQueue = dispatch_queue_create("Logger.write.queue", DISPATCH_QUEUE_SERIAL);
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:_logPath]) {
            //            NSLog(@"createFileAtPath _logPath %@ ", _logPath);
            [[NSFileManager defaultManager] createFileAtPath:_logPath
                                                    contents:nil
                                                  attributes:nil];
        }
        
        
        _verboseMesageSaveStep = 10;  //每10个记录一次，以减少日质量（4.6MB／15m vs 0.46MB／15m）
        _verboseMesageCount = 0;
        
        _fileHandle = [NSFileHandle fileHandleForWritingAtPath:_logPath];

    }
    return self;
}

+ (void)log:(NSString *)message level:(ZHFLogger_level)level tag:(ZHFLogger_tag)tag {
    
    static NSDateFormatter* timeStampFormat;
    if (!timeStampFormat) {
        timeStampFormat = [[NSDateFormatter alloc] init];
        [timeStampFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS"];
        [timeStampFormat setTimeZone:[NSTimeZone systemTimeZone]];
    }
    NSString* timestamp = [timeStampFormat stringFromDate:[NSDate date]];
    NSString *logText = [NSString stringWithFormat:@"%@ [%@-%@][%ld-%ld] %@", timestamp,KAppName,  APP_Version, (long)level, (long)tag,message];
    
    
    
    ZHFLogger_level zhf_level = [ZHFLogerManager sharedZHFLogerManager].ZHF_LOG_LEVEL_LIMIT;
    
    //ZHF_Tag_event 所有类型log 全部保存
    
    [[ZHFLogerManager sharedZHFLogerManager] saveLogText:[NSString stringWithFormat:@"%@\n", logText] tag:tag];
    
    //ZHF_Tag_event 类型全部打印 || 等级大于设置的打印
    if (tag == ZHF_Tag_event || level >= zhf_level) {
        NSLog(@"%@",logText);
    }
}

- (void)saveLogText:(NSString *)text tag:(ZHFLogger_tag)tag {
    dispatch_async(_writeQueue, ^(){
        
        BOOL verbose_filter = NO;
        if (tag == ZHF_Tag_verbose) {
            _verboseMesageCount = _verboseMesageCount + 1;
            if (_verboseMesageCount % _verboseMesageSaveStep != 0) {
                verbose_filter = YES;
            }
        }
        
        if (verbose_filter) {
            return;
        }
        
        [_fileHandle seekToEndOfFile];
        [_fileHandle writeData:[text dataUsingEncoding:NSUTF8StringEncoding]];
        [_fileHandle synchronizeFile];
    });
}

+ (void)setLogLevel:(ZHFLogger_level)level {
    [ZHFLogerManager sharedZHFLogerManager].ZHF_LOG_LEVEL_LIMIT = level;
}


@end
