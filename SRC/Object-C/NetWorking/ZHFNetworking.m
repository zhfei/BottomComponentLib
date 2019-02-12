//
//  ZHFNetworking.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "ZHFNetworking.h"
#import "ZHFRequestParameter.h"
#import <AFNetworking/AFNetworking.h>
/// 当前任务ID
NSInteger KCurrentTaskIdentifier = -1;
NSInteger const kAFNetworkingTimeoutInterval = 30;

@implementation ZHFNetworking
static AFHTTPSessionManager *aManager;
+ (AFHTTPSessionManager *)sharedZHFNetworking
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        aManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        //以下三项manager的属性根据需要进行配置
        aManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        aManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/xml",@"text/json",@"text/plain",@"text/JavaScript",@"application/json",@"image/jpeg",@"image/png",@"application/octet-stream",nil];
        
        
        // 设置超时时间
        aManager.requestSerializer.timeoutInterval = kAFNetworkingTimeoutInterval;
    });
    return aManager;
}

//异步请求
+ (void)asyncWithParameter:(ZHFRequestParameter *)parameter
                   success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSError *error))failure {
    
        NSURLSessionDataTask *dataTask;
        switch (parameter.requestMethod) {
        case ZHFRequestMethodGET:
        {
            dataTask = [[ZHFNetworking sharedZHFNetworking] GET:parameter.totalURLString parameters:parameter.parameterDictionary progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"responseObject:%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case ZHFRequestMethodPOST:
        {
            dataTask = [[ZHFNetworking sharedZHFNetworking] POST:parameter.totalURLString parameters:parameter.parameterDictionary progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"responseObject:%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
            
        default:
        {
            NSLog(@"待添加...");
        }
            break;
    }
    KCurrentTaskIdentifier = dataTask.taskIdentifier;
}

/*!**上传***/
+ (void)uploadTaskWithParameter:(ZHFRequestParameter *)parameter
                           data:(NSData *)data
                       progress:(void (^)(NSProgress *uploadProgress))uploadProgressBlock
              completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    // step1. 初始化AFURLSessionManager对象

    // step2. 获取AFURLSessionManager的task对象
//    NSMutableData *dataM = [NSMutableData data];
//    NSData *data = [NSData dataWithContentsOfURL:fileURL];
//    [dataM appendData:data];
//    NSURLSessionDataTask *dataTask =[[ZHFNetworking sharedZHFNetworking] uploadTaskWithRequest:request fromData:dataM progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//
//    }];
    
    [[ZHFNetworking sharedZHFNetworking] POST:parameter.totalURLString parameters:parameter.parameterDictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        [formData appendPartWithFileURL:[NSURL URLWithString:parameter.totalURLString] name:@"file" fileName:@"234.png" mimeType:@"image/png" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"完成进度：%.5lld",uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    // step3. 发动task
//    [dataTask resume];
}
/*!**下载***/
+ (void)downloadTaskWithWithParameters:(ZHFRequestParameter *)parameter
                                 progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                        completionHandler:(nullable void (^)(NSURLResponse *response, NSURL *_Nullable filePath, NSError *_Nullable error))completionHandler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:parameter.totalURLString]];
    
    NSURLSessionDownloadTask *dataTask = [[ZHFNetworking sharedZHFNetworking] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"完成进度：%.5lld",downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSLog(@"默认下载地址:%@",targetPath);
        NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        //重新设置下载地址
        return [NSURL URLWithString:cacheDir];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"下载完成！");
    }];
    [dataTask resume];
}

+ (void)cancelCurrentDataTask {
    NSMutableArray *dataTasks = [NSMutableArray arrayWithArray:[self sharedZHFNetworking].dataTasks];
    for (NSURLSessionDataTask *taskObj in dataTasks) {
        if (taskObj.taskIdentifier == KCurrentTaskIdentifier) {
            [taskObj cancel];
        }
    }
}

+ (void)cancelDataTask {
    NSMutableArray *dataTasks = [NSMutableArray arrayWithArray:[self sharedZHFNetworking].dataTasks];
    for (NSURLSessionDataTask *taskObj in dataTasks) {
        [taskObj cancel];
    }
}

+ (void)networkStatus {
    //网络状态监听者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络...");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络...");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网络...");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi网络...");
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

@end
