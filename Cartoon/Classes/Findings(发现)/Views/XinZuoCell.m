//
//  XinZuoCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "XinZuoCell.h"
#import "UIView+Extension.h"
#import <UIImageView+WebCache.h>
#import "WordsDetailViewController.h"
#import "topicModel.h"

static CGFloat const spaceing = 10;

@interface XinZuoCell ()

@property (nonatomic,strong) UIImageView *topImageView;

@property (nonatomic,strong) UIImageView *bottomImageView;


@end

@implementation XinZuoCell


- (void)setTopics:(NSArray *)topics {
    _topics = topics;
    
    topicModel *top    = [topics firstObject];
    topicModel *bottom = [topics lastObject];

    UIImage *placeImage = [UIImage imageNamed:@"ic_new_comic_placeholder_s_355x149_"];
    
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:top.cover_image_url]
                      placeholderImage:placeImage];
    
    [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:bottom.cover_image_url]
                         placeholderImage:placeImage];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.width - spaceing * 2;
    CGFloat h = (self.height - spaceing * 3) * 0.5;
    
    self.topImageView.frame = CGRectMake(spaceing, spaceing, w, h);
    self.bottomImageView.frame = CGRectMake(spaceing,h + (2 * spaceing),w, h);
    
}

- (void)tap:(UITapGestureRecognizer *)tap {
    
    NSInteger index = [[tap view] tag];
    
    topicModel *md = [self.topics objectAtIndex:index];
    
    WordsDetailViewController *wdvc = [WordsDetailViewController new];
    
    wdvc.wordsID = md.ID.stringValue;
    
    [[self findResponderWithClass:[UINavigationController class]] pushViewController:wdvc animated:YES];
    
}


- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [UIImageView new];
        _topImageView.userInteractionEnabled = YES;
        _topImageView.tag = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [_topImageView addGestureRecognizer:tap];
        [self.contentView addSubview:_topImageView];
    }
    return _topImageView;
}

- (UIImageView *)bottomImageView {
    if (!_bottomImageView) {
        _bottomImageView = [UIImageView new];
        _bottomImageView.userInteractionEnabled = YES;
        _topImageView.tag = 1;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [_bottomImageView addGestureRecognizer:tap];
        [self.contentView addSubview:_bottomImageView];
    }
    return _bottomImageView;
}

@end
