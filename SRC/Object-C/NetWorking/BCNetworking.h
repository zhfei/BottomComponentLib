//
//  BCNetworking.h
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BCRequestParameter;

@interface BCNetworking : NSObject
//异步请求
+ (void)asyncWithParameter:(BCRequestParameter *)parameter
                   success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSError *error))failure;

/*!**上传***/
+ (void)uploadTaskWithParameter:(BCRequestParameter *)parameter
                           data:(NSData *)data
                       progress:(void (^)(NSProgress *uploadProgress))uploadProgressBlock
              completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

/*!**下载***/
+ (void)downloadTaskWithWithParameters:(BCRequestParameter *)parameter
                                 progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                        completionHandler:(nullable void (^)(NSURLResponse *response, NSURL *_Nullable filePath, NSError *_Nullable error))completionHandler;

/**
 取消队列
 */
+(void)cancelDataTask;
/**
 取消当前任务
 */
+(void)cancelCurrentDataTask;


#pragma mark - tools
//开启网络监听
+ (void)setupNetworkStatusAndStartMonitoring;
+ (void)stopMonitoring;
//网络请求根据缓存策略，缓存到相应的位置。
+ (void)setupRequestCache;

@end
