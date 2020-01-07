//
//  BCPersistenceProtocol.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/11/5.
//  Copyright © 2018年 zhoufei. All rights reserved.
//
//  持久化协议

#import <Foundation/Foundation.h>
#import "BCMacro.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BCPersistenceProtocol <NSObject>
@property (nonatomic, strong) NSString *path;   //保存路径
@property (nonatomic, strong) NSString *keyWord;//关键字

/**
 保存数据
 */
- (void)saveData;
@end

NS_ASSUME_NONNULL_END
