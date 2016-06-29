//
//  SearchresultsCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "SearchResultsCell.h"
#import "searchWordModel.h"
#import <UIImageView+WebCache.h>
#import "NSString+Extension.h"

@interface SearchResultsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *wordImageView;

@property (weak, nonatomic) IBOutlet UILabel *topicTitle;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIButton *likeCount;

@property (weak, nonatomic) IBOutlet UIButton *replyCount;

@end

@implementation SearchResultsCell

+ (instancetype)makeSearchResultsCellWithTableView:(UITableView *)tableView
                                    WithTopicModel:(searchWordModel *)md {
    
    SearchResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultsCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SearchResultsCell" owner:nil options:nil] firstObject];
    }
    
    cell.model = md;
    
    return cell;
}

- (void)setModel:(searchWordModel *)model {
    _model = model;
    
    [self.wordImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:[UIImage imageNamed:@"ic_common_placeholder_s_73x23_"]];
    
    self.topicTitle.text = model.title;
    
    self.userName.text = model.user.nickname;
    
    [self.likeCount setTitle:[NSString makeTextWithCount:model.likes_count.integerValue] forState:UIControlStateNormal];
    
    [self.replyCount setTitle:[NSString makeTextWithCount:model.comments_count.integerValue] forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    // Initialization code
}


@end
