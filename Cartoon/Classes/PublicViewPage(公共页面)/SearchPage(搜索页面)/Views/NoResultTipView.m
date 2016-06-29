
//  NoResultTipView.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import "NoResultTipView.h"
#import <Masonry.h>

static CGFloat spaceing = 8.0;

@implementation NoResultTipView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIImageView *nodata = [UIImageView new];
    
    nodata.image = [UIImage imageNamed:@"ic_search_empty_82x104_"];
    
    [self addSubview:nodata];
    
    [nodata mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(spaceing);
        make.height.equalTo(@104);
        make.width.equalTo(@82);
        make.centerX.equalTo(self);
    }];
    
    UILabel *tipLabel  = [UILabel new];
    
    tipLabel.text = @"无结果~";
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:tipLabel];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self);
        make.top.equalTo(nodata.mas_bottom).offset(spaceing);
    }];
    
}

@end
