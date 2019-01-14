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
        aManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/xml",@"text/json",@"text/plain",@"text/JavaScript",@"application/json",@"image/jpeg",@"image/png",@"application/octet-stream",nil];
        
        aManager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
//同步请求
+ (void)syncWithParameter:(ZHFRequestParameter *)parameter
                  success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSError *error))failure {
    
}
/*!**上传***/
+ (void)uploadTaskWithRequest:(NSURLRequest *)request
                        fromFile:(NSURL *)fileURL
                        progress:(void (^)(NSProgress *uploadProgress))uploadProgressBlock
               completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    // step1. 初始化AFURLSessionManager对象

    // step2. 获取AFURLSessionManager的task对象
    NSURL *url;
    NSURLSessionDataTask *dataTask =[[ZHFNetworking sharedZHFNetworking] uploadTaskWithRequest:request fromFile:url progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
    // step3. 发动task
    [dataTask resume];
}
/*!**下载***/
+ (void)downloadTaskWithWithParameters:(ZHFRequestParameter *)parameter
                                 progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                        completionHandler:(nullable void (^)(NSURLResponse *response, NSURL *_Nullable filePath, NSError *_Nullable error))completionHandler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:parameter.totalURLString]];
    
    NSURLSessionDataTask *dataTask = [[ZHFNetworking sharedZHFNetworking] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:nil completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"response:%@",response);
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

@end
