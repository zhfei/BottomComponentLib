//
//  BCRequestParameter.h
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!**网络请求类型***/
typedef NS_ENUM(NSUInteger, BCRequestMethod) {
    BCRequestMethodGET, //GET请求方式
    BCRequestMethodPOST,
    BCRequestMethodPUT,
    BCRequestMethodDELETE,
    BCRequestMethodHEAD,
    BCRequestMethodOPTIONS,
    BCRequestMethodCONNECT,
    BCRequestMethodTRACE
};


@interface BCRequestParameter : NSObject
/*! 接口API(不带域名,域名默认添加)*/
@property (nonatomic, copy) NSString *apiString;
/*!请求参数*/
@property (nonatomic, strong) NSMutableDictionary *parameterDictionary;
/*!请求类型*/
@property (nonatomic, assign) BCRequestMethod requestMethod;
/*!自定义域名（不设置的话，使用默认的域名）*/
@property (nonatomic, copy) NSString *customDomain;
@property (nonatomic, copy,readonly) NSString *totalURLString;
@end
