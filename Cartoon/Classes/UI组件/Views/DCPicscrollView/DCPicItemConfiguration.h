//
//  DCPicItemConfiguration.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>

@interface DCPicItemConfiguration : NSObject

//imageViewSetting

@property (nonatomic,assign) UIViewContentMode contentMode;

@property (nonatomic,strong) UIImage *placeImage;


//titleLableSetting

@property (nonatomic,strong) UIColor *textColor;

@property (nonatomic,strong) UIFont  *textFont;


//bottomViewSetting

@property (nonatomic,strong) UIColor *bgColor;

@property (nonatomic,strong) UIImage *bgImage;

@property (nonatomic,assign) BOOL showBottomView;

@property (nonatomic,assign) CGFloat bottomViewHeight;


+ (instancetype)defaultConfiguration;
+ (instancetype)hasTitleViewConfiguration;

@end
