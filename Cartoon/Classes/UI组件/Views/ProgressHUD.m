//
//  ProgressHUD.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import "ProgressHUD.h"

static CGFloat dissmissDelay = 1;
static JGProgressHUDStyle style = JGProgressHUDStyleExtraLight;


@implementation ProgressHUD

+ (dissmissCallBack)showProgressWithStatus:(NSString *)status inView:(UIView *)view {
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:style];
    
    HUD.userInteractionEnabled = NO;
    [HUD showInView:view];
    
    return ^{[HUD dismiss];};
}




+ (void)showErrorWithStatus:(NSString *)status inView:(UIView *)view {
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:style];
    
    HUD.textLabel.textColor = [[UIColor alloc] initWithWhite:0.4 alpha:1];
    
     HUD.textLabel.text = status;
     HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc] init]; //
     HUD.interactionType = JGProgressHUDInteractionTypeBlockNoTouches;
     HUD.userInteractionEnabled = NO;

    [HUD showInView:view];
    [HUD dismissAfterDelay:dissmissDelay];
    
}

+ (void)showSuccessWithStatus:(NSString *)status inView:(UIView *)view {
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:style];
    
    HUD.textLabel.text = status;
    HUD.indicatorView = [[JGProgressHUDSuccessIndicatorView alloc] init]; //
    HUD.interactionType = JGProgressHUDInteractionTypeBlockNoTouches;
    HUD.userInteractionEnabled = NO;

    [HUD showInView:view];
    [HUD dismissAfterDelay:dissmissDelay];
    
}

+ (void)showCustomImage:(NSString *)imageName inView:(UIView *)view {
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:style];
    
    HUD.userInteractionEnabled = NO;
    HUD.interactionType = JGProgressHUDInteractionTypeBlockNoTouches;
    HUD.indicatorView = [[JGProgressHUDImageIndicatorView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    [HUD showInView:view];

    [HUD dismissAfterDelay:dissmissDelay];
    
}


@end
