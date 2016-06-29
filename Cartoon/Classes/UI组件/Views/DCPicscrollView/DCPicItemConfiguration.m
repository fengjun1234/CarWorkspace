//
//  DCPicItemConfiguration.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "DCPicItemConfiguration.h"

@implementation DCPicItemConfiguration

+ (instancetype)defaultConfiguration {
    
    DCPicItemConfiguration *pic = [[DCPicItemConfiguration alloc] init];
    
    pic.contentMode = UIViewContentModeScaleAspectFill;
    pic.showBottomView = NO;
    
    return pic;
}

+ (instancetype)hasTitleViewConfiguration {
    
    DCPicItemConfiguration *pic = [[DCPicItemConfiguration alloc] init];
    
    pic.showBottomView = YES;
    pic.bottomViewHeight = 25;
    pic.textColor   = [UIColor whiteColor];
    pic.textFont    = [UIFont systemFontOfSize:15];
    pic.bgColor     = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    pic.contentMode = UIViewContentModeScaleAspectFill;
    
    return pic;
}
@end
