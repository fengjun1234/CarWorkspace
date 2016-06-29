//
//  DCPicScrollView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import <UIKit/UIKit.h>

#import "DCPicItem.h"
#import "DCPicScrollViewConfiguration.h"
#import "NSTimer+Control.h"


@class DCPicScrollView;


@protocol DCPicScrollViewDataSource <NSObject>

@required

- (NSUInteger)numberOfItemsInPicScrollView:(DCPicScrollView *)picScrollView;

- (void)picScrollView:(DCPicScrollView *)picScrollView
            needUpdateItem:(DCPicItem *)item
              atIndex:(NSInteger)index;

@end

@protocol DCPicScrollViewDelegate <NSObject>

@optional

- (void)picScrollView:(DCPicScrollView *)picScrollView
           selectItem:(DCPicItem *)item
              atIndex:(NSInteger)index;

@end


@interface DCPicScrollView : UIView


@property (nonatomic,weak) id<DCPicScrollViewDataSource> dataSource;

@property (nonatomic,weak) id<DCPicScrollViewDelegate> delegate;

@property (nonatomic,readonly) NSUInteger currentIndex;

@property (nonatomic,strong,readonly) NSTimer *timer;


//if you not set Configuration,will use defaultConfiguration

+ (instancetype)picScrollViewWithFrame:(CGRect)frame
                     withConfiguration:(DCPicScrollViewConfiguration *)configuration
                        withDataSource:(id<DCPicScrollViewDataSource>)dataSource;

+ (instancetype)picScrollViewWithFrame:(CGRect)frame
                        withDataSource:(id<DCPicScrollViewDataSource>)dataSource;

- (instancetype)initWithFrame:(CGRect)frame
               withDataSource:(id<DCPicScrollViewDataSource>)dataSource;

- (instancetype)initWithFrame:(CGRect)frame
            withConfiguration:(DCPicScrollViewConfiguration *)configuration
               withDataSource:(id<DCPicScrollViewDataSource>)dataSource;

- (void)removeTimer;

- (void)reloadData;

@end



