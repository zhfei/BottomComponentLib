//
//  ViewController.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "ViewController.h"
#import "ZHFLogerManager.h"
#include "ZHFProgressHUD.h"
#import "Utility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [Utility executeTime:^{
        NSString *str = [NSString stringWithFormat:@"touche: %@",[touches anyObject]];
        [ZHFLogerManager log:str level:ZHF_Level_Warn tag:ZHF_Tag_default];
        
        //    [ZHFProgressHUD popupSuccessMessage:@"成功"];
        //    [ZHFProgressHUD popToastMessage:@"成功"];
        [ZHFProgressHUD popMessage:@"请先开启手势密码\n请先开启手势密码"];
    }];
    
}


@end
