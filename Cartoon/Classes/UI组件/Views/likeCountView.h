//
//  likeCountView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>



@interface likeCountView : UIButton

@property (nonatomic) BOOL islike;                  //当前状态

@property (nonatomic,copy) NSString *requestID;     //点赞请求ID

@property (nonatomic) NSInteger  likeCount;         //设置赞数

+ (instancetype)likeCountViewWithCount:(NSInteger)count requestID:(NSString *)ID;

@end
