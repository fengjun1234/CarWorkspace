//
//  SummaryListItem.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "SummaryListItem.h"
#import "UIView+Extension.h"
/* SummaryListItem  */

@interface SummaryListItem ()

@property (nonatomic,weak) WordsListView *slv;

@end

@implementation SummaryListItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        WordsListView *slv = [[WordsListView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        [self.contentView addSubview:slv];
        
        self.slv = slv;
                
        self.backgroundColor = slv.backgroundColor;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.slv.frame = self.bounds;
    
}

- (void)setHasNotBeenUpdated:(BOOL)hasNotBeenUpdated {
    self.slv.hasNotBeenUpdated = hasNotBeenUpdated;
}

- (void)setUrlString:(NSString *)urlString {
    self.slv.urlString = urlString;
}


@end