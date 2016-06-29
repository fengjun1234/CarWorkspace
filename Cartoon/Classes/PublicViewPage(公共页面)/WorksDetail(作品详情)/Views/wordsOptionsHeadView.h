//
//  wordsOptionsHeadView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>
#import "CommonMacro.h"

#define wordsOptionsHeadViewHeight 40

@interface wordsOptionsHeadView : UIView

@property (nonatomic,copy) void (^lefeBtnClick)(UIButton *btn);

@property (nonatomic,copy) void (^rightBtnClick)(UIButton *btn);


@end
