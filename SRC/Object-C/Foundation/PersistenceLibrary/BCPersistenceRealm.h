//
//  BCPersistenceRealm.h
//  BottomComponentLib
//
//  Created by 周飞 on 2018/11/5.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCPersistenceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BCPersistenceRealm : NSObject <BCPersistenceProtocol>
SingletonH(BCPersistenceRealm)
@end

NS_ASSUME_NONNULL_END
