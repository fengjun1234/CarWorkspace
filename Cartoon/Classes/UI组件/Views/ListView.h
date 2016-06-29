//
//  ListView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@interface ListViewConfiguration : NSObject

@property (nonatomic,assign) BOOL hasSelectAnimate;

@property (nonatomic,strong) UIColor *labelTextColor;

@property (nonatomic,strong) UIColor *labelSelectTextColor;

@property (nonatomic,strong) UIColor *lineColor;    //线的颜色

@property (nonatomic) CGFloat spaceing; //间距

@property (nonatomic,strong) UIFont  *font; //字体

@property (nonatomic) CGFloat  labelWidth;

@property (nonatomic,weak) UIScrollView *monitorScrollView; //监听的ScrollView

@property (nonatomic) CGFloat MonitorScrollViewItemWidth;


+ (instancetype)defaultConfiguration;

@end


@interface ListView : UIView
{
    __weak UIView *_lineView;
    
    NSMutableArray *_titleLabelArray;
    NSMutableArray *_titleLabelFrameCache;
}

@property (nonatomic,copy) NSArray *labelTextArray;

@property (nonatomic,weak,readonly) UILabel *currentSelectLabel;

@property (nonatomic,copy) void (^selectAtIndex)(NSInteger index);

@property (nonatomic,readonly) NSInteger currentIndex;


+ (instancetype)listViewWithFrame:(CGRect)frame
                        TextArray:(NSArray *)textArray
                    Configuration:(ListViewConfiguration *)configuration;

- (instancetype)initWithFrame:(CGRect)frame
                    TextArray:(NSArray *)textArray
                Configuration:(ListViewConfiguration *)configuration;

+ (instancetype)listViewWithFrame:(CGRect)frame TextArray:(NSArray *)textArray;

- (instancetype)initWithFrame:(CGRect)frame TextArray:(NSArray *)textArray;


@end
