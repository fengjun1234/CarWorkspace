//
//  CartoonFlooterView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>



@protocol CartoonFlooterViewDelegate <NSObject>

@optional

- (void)commentButtonAction;    //开启评论

- (void)previousPage;   //上一篇

- (void)nextPage;   //下一篇

- (void)showShareView;  //显示分享视图

@end

@class comicsModel;

static const CGFloat CartoonFlooterViewHeight = 200.f;

@interface CartoonFlooterView : UIView

@property (nonatomic,weak) id<CartoonFlooterViewDelegate> delegate;

@property (nonatomic,strong) comicsModel *model;


+ (instancetype)makeCartoonFlooterView;

@end


