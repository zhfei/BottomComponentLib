//
//  BCProgressHUD.m
//  BottomComponentLib
//
//  Created by zhoufei on 2018/10/11.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "BCProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

static MBProgressHUD *BCLastHUD;
static NSInteger animationDuration = 1.f;
static NSInteger HUD_width = 100.f;
static NSInteger HUD_height = 80.f;

@implementation BCProgressHUD
+ (void)popupErrorMessage:(NSString *)errorMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD * HUD = [self popWithMessage:errorMessage customView:[self customImageViewWithImageName:@"progress_fail"]];
        [HUD hideAnimated:YES afterDelay:animationDuration];
    });
}

+ (void)popupSuccessMessage:(NSString *)successMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD * HUD = [self popWithMessage:successMessage customView:[self customImageViewWithImageName:@"progress_success"]];
        [HUD hideAnimated:YES afterDelay:animationDuration];
    });
    
}

+ (void)popupSuccessMessage:(NSString *)successMessage completionBlock:(void(^)())completionBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD * HUD = [self popWithMessage:successMessage customView:[self customImageViewWithImageName:@"progress_success"]];
        HUD.completionBlock = completionBlock;
        [HUD hideAnimated:YES afterDelay:animationDuration];
    });
}

+ (void)popupWarningMessage:(NSString *)warningMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD * HUD = [self popWithMessage:warningMessage customView:[self customImageViewWithImageName:@"progress_warning"]];
        [HUD hideAnimated:YES afterDelay:animationDuration];
    });
}
+ (void)popupMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self popWithMessage:message customView:nil];
    });
}

+ (void)dismissMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        [BCLastHUD hideAnimated:YES afterDelay:0.0f];
        BCLastHUD = nil;
    });
    
}

+ (void)dismissMessageAfterDelay:(CGFloat)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        [BCLastHUD hideAnimated:YES afterDelay:delay];
        BCLastHUD = nil;
    });
    
}

+ (void)dismissAnimated:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        [BCLastHUD hideAnimated:animated];
        BCLastHUD = nil;
    });
    
}

+ (void)popToastMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD * HUD = [self popWithMessage:message customView:nil];
        [HUD hideAnimated:YES afterDelay:animationDuration];
    });
}

+ (void)popMessage:(NSString *)message {
    if (BCLastHUD) {
        [BCLastHUD hideAnimated:NO];
    }
    id<UIApplicationDelegate>app = [UIApplication sharedApplication].delegate;
    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:[app window] animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.completionBlock = NULL;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
    NSArray *messages = [message componentsSeparatedByString:@"\n"];
    HUD.label.text = messages[0];
    if (messages.count > 1) {
        HUD.detailsLabel.text = messages[1];
    }
#pragma clang diagnostic pop
    [HUD hideAnimated:YES afterDelay:animationDuration];
}

+ (void)message:(NSString *)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (BCLastHUD) {
            BCLastHUD.label.text = message;
        }
    });
}

+ (UIImageView *)customImageViewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *customImageView = [[UIImageView alloc] initWithImage:image];
    
    CGSize minSize =  CGSizeMake(120, 90);
    CGRect successViewFrame = customImageView.frame;
    if (successViewFrame.size.width < minSize.height && successViewFrame.size.height < minSize.height ) {
        successViewFrame.size.width  = minSize.width;
        successViewFrame.size.height = minSize.height;
        customImageView.frame            = successViewFrame;
    }
    return customImageView;
}

+ (MBProgressHUD *)popWithMessage:(NSString *)message customView:(UIView *)customView {
    if (BCLastHUD) {
        [BCLastHUD hideAnimated:NO];
    }
    id<UIApplicationDelegate>app = [UIApplication sharedApplication].delegate;
    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:[app window] animated:YES];
    if (customView) {
        HUD.customView = customView;
        HUD.mode = MBProgressHUDModeCustomView;
    }
    HUD.completionBlock = NULL;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
    HUD.bezelView.color  = [UIColor blackColor];
    HUD.label.textColor  = [UIColor whiteColor];
    HUD.activityIndicatorColor = [UIColor whiteColor];
    HUD.minSize     = CGSizeMake(HUD_width, HUD_height);
    NSArray *messages = [message componentsSeparatedByString:@"\n"];
    HUD.label.text = messages[0];
    if (messages.count > 1) {
        HUD.detailsLabel.text = messages[1];
    }
    HUD.opacity = 0.75;
    BCLastHUD = HUD;
    return HUD;
#pragma clang diagnostic pop
}
@end
