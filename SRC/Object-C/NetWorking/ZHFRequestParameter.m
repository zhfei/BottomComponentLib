//
//  ZHFRequestParameter.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "ZHFRequestParameter.h"
#import "GlobalConfig.h"

@interface ZHFRequestParameter()
@property (nonatomic, strong) NSString *defaultDomain;
@end

@implementation ZHFRequestParameter
#pragma mark - Life Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.defaultDomain = Domain;
        //ZF_initData.zip
        self.requestMethod = ZHFRequestMethodGET;
    }
    return self;
}

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Event

#pragma mark - Getter, Setter
- (NSString *)totalURLString {
    return [NSString stringWithFormat:@"%@/%@",self.defaultDomain,self.apiString];
}

- (void)setCustomDomain:(NSString *)customDomain {
    self.defaultDomain = customDomain;
}

@end
