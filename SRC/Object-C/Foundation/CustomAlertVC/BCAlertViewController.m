//
//  InputAlertViewController.m
//  iOS_KnowledgeStructure
//
//  Created by 周飞 on 2019/1/23.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import "BCAlertViewController.h"
#import <Masonry.h>
#import "BCTopWindow.h"
#import "BCAlertView.h"

@interface BCAlertViewController () <BCAlertViewDelegate>
@property (nonatomic, assign) ZFAlertType alertType;
@end

@implementation BCAlertViewController
#pragma mark - Life Cycle

- (instancetype)initWithType:(ZFAlertType)type
{
    self = [super init];
    if (self) {
        self.alertType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.alertType == ZFAlertTypeInput) {
        BCAlertView *alerter = [BCAlertView alertView];
        alerter.delegate = self;
        CGSize size = alerter.bounds.size;
        
        [self.view addSubview:alerter];
        [alerter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.centerX.equalTo(self.view.mas_centerX);
            make.centerY.equalTo(self.view.mas_centerY);
        }];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[BCTopWindow sharedBCTopWindow] setHidden:YES];
}

#pragma mark - Getter, Setter

#pragma mark - Event


#pragma mark - Public Method
+ (BCAlertViewController *)alertViewController:(ZFAlertType)type {
    BCAlertViewController *alertVC = [[BCAlertViewController alloc] initWithType:type];
    return alertVC;
}

- (void)showAlertVC {
    BCTopWindow *window = [BCTopWindow sharedBCTopWindow];
    window.hidden = NO;
    [window.rootViewController presentViewController:self animated:NO completion:nil];
}

#pragma mark - Private Method
- (void)setupData {
    
}

- (void)setupUI {
    
}

- (void)resetData {
    
}

- (void)resetUI {
    
}

#pragma mark - Delegate
- (void)alertViewDelegate:(BCAlertView *)alertView sureAction:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)alertViewDelegate:(BCAlertView *)alertView cancleAction:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)alertViewDelegate:(BCAlertView *)alertView endEdit:(UITextView *)textView {
     [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - NSCopying

#pragma mark - NSObject

@end
