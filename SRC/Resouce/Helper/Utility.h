//
//  Utility.h
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
OBJC_EXTERN NSString* getXUUID();
OBJC_EXTERN BOOL validateMobileNumber(NSString *mobileNumber);
@end
