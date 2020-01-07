//
//  ZFAlertView.h
//  iOS_KnowledgeStructure
//
//  Created by 周飞 on 2019/1/23.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCAlertView;

NS_ASSUME_NONNULL_BEGIN

typedef void(^BtnTapBlock)();

@protocol BCAlertViewDelegate <NSObject>
- (void)alertViewDelegate:(BCAlertView *)alertView sureAction:(UIButton *)sender;
- (void)alertViewDelegate:(BCAlertView *)alertView cancleAction:(UIButton *)sender;
- (void)alertViewDelegate:(BCAlertView *)alertView endEdit:(UITextView *)textView;

@end

@interface BCAlertView : UIView
@property (nonatomic, weak) id<BCAlertViewDelegate> delegate;
+ (BCAlertView *)alertView;
@end

NS_ASSUME_NONNULL_END
