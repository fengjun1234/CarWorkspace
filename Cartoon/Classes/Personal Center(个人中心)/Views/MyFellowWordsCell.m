//
//  MyFellowWordsCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "MyFellowWordsCell.h"
#import "FellowTopicsModel.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import "CommonMacro.h"

@interface MyFellowWordsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *wordsImage;

@property (weak, nonatomic) IBOutlet UILabel *wordsName;

@property (weak, nonatomic) IBOutlet UILabel *wordsAuthor;

@property (weak, nonatomic) IBOutlet UILabel *wordsTitle;

@end

@implementation MyFellowWordsCell

- (void)setModel:(FellowTopicsModel *)model {
    
    _model = model;
    
    [self.wordsImage sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]
                       placeholderImage:[UIImage imageNamed:@"ic_common_placeholder_s_73x23_"]];
    
    [self.wordsName setText:model.title];
    [self.wordsTitle setText:model.latest_comic_title];
    [self.wordsAuthor setText:model.user.nickname];
}
+ (instancetype)makeMyFellowWordsCell {
    return [[[NSBundle mainBundle] loadNibNamed:@"MyFellowWordsCell" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {

    [self setupBottomLine];
    
}

- (void)setupBottomLine {
    
    UIView *line = [UIView new];
    
    line.backgroundColor = [[UIColor alloc] initWithWhite:0.9 alpha:1];
    
    [self.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.equalTo(@(SINGLE_LINE_WIDTH));
    }];
    
}




@end
