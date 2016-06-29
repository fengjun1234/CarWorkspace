//
//  DCPicScrollViewConfiguration.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "DCPicScrollViewConfiguration.h"


@interface pageControl : UIPageControl <pageControlProtocol>

@end

@implementation pageControl

@end


@implementation DCPicScrollViewConfiguration

+ (instancetype)defaultConfiguration {
    
    DCPicScrollViewConfiguration *psvc = [[DCPicScrollViewConfiguration alloc] init];
    
    psvc.needAutoScroll = YES;
    psvc.timeInterval = 3;
    psvc.pageAlignment = PageContolAlignmentRight;
    psvc.itemConfiguration = [DCPicItemConfiguration defaultConfiguration];
    psvc.pageEdgeInsets = UIEdgeInsetsMake(0, 0,5,5);

    pageControl *page = [[pageControl alloc] init];
    page.currentPageIndicatorTintColor = [UIColor whiteColor];
    page.pageIndicatorTintColor = [UIColor lightGrayColor];

    psvc.page = page;
    
    return psvc;
}

- (void)setPageAlignment:(PageContolAlignment)pageAlignment {
    _pageAlignment = pageAlignment;
    if (pageAlignment != PageContolAlignmentRight) {
        self.itemConfiguration.showBottomView = NO;
    }
}

@end