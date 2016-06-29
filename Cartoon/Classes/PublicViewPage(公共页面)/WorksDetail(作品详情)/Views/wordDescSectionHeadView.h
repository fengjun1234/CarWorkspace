//
//  wordDescSectionHeadView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>

@interface wordDescSectionHeadView : UIView

@property (nonatomic,copy) NSString *desc;

@property (nonatomic,copy) void (^needReloadHeight)();


- (CGFloat)myHeight;

@end
