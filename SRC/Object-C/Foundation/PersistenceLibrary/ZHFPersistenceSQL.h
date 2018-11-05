//
//  ZHFPersistenceSQL.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/11/5.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHFPersistenceProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZHFPersistenceSQL : NSObject <ZHFPersistenceProtocol>
SingletonH(ZHFPersistenceSQL)

@end

NS_ASSUME_NONNULL_END
