//
//  wordTableViewCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "wordTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "NSString+Extension.h"

@interface wordTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *wordImageView;

@property (weak, nonatomic) IBOutlet UILabel *wordTitleLable;

@property (weak, nonatomic) IBOutlet UIButton *like_Count;

@property (weak, nonatomic) IBOutlet UILabel *creat_Time;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@end

@implementation wordTableViewCell

- (void)awakeFromNib {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.imageWidth.constant = 120;
}

- (void)setModel:(CartonnWordsModel *)model {
    _model = model;
    
    [self.wordImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:[UIImage imageNamed:@"ic_common_placeholder_l_120x38_"]];
    
    self.wordTitleLable.text = model.title;
    
    [self.like_Count setTitle:[NSString makeTextWithCount:model.likes_count.integerValue] forState:UIControlStateNormal];
    
    self.creat_Time.text = [[NSString timeWithTimeStamp:model.created_at.integerValue] substringFromIndex:5];
    
    [self.like_Count sizeToFit];
    
}
@end
