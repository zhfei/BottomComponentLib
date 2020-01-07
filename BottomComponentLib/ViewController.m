//
//  ViewController.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/12.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import "ViewController.h"
#import "BCLogerManager.h"
#include "BCProgressHUD.h"
#import "BCUtility.h"

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
    [BCUtility executeTime:^{
        NSString *str = [NSString stringWithFormat:@"touche: %@",[touches anyObject]];
        [BCLogerManager log:str level:BC_Level_Warn tag:BC_Tag_default];
        
        //    [BCProgressHUD popupSuccessMessage:@"成功"];
        //    [BCProgressHUD popToastMessage:@"成功"];
        [BCProgressHUD popMessage:@"请先开启手势密码\n请先开启手势密码"];
    }];
    
}


@end
