//
//  UserNotLoginTipView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,tipOption) {
    tipOptionNotLogin,          //用户没有登录
    tipOptionNotConcerned,      //登录但没有作品
};

@interface UserNotLoginTipView : UIView

@property (nonatomic,copy) void (^loginOnClick)(UserNotLoginTipView *sender);

@property (nonatomic) tipOption tip;


+ (instancetype)makeUserNotLoginTipView;

@end
