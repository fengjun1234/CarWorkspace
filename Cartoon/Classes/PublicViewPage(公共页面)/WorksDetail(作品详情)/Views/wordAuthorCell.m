//
//  wordAuthorCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "wordAuthorCell.h"
#import "UIView+Extension.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "userModel.h"



#define iconSize 30

@interface wordAuthorCell ()

@property (nonatomic,weak) UIImageView *authorIcon;

@property (nonatomic,weak) UILabel *authorName;


@end

@implementation wordAuthorCell

- (void)setModel:(userModel *)model {
    _model = model;
    
    [self.authorIcon sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]];
    
     self.authorName.text = model.nickname;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImageView *authorIcon = [UIImageView new];
    
    [authorIcon cornerRadius:iconSize * 0.5];
    
    [self.contentView addSubview:authorIcon];
    
    [authorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(SPACEING);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@(iconSize));
    }];

    self.authorIcon = authorIcon;
    
    UILabel *titleLabel  = [UILabel new];
    
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(authorIcon.mas_right).offset(SPACEING);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(15));
        make.right.equalTo(self.contentView);
    }];
    
    self.authorName = titleLabel;
    
    UIView *bottomLine = [UIView new];
    
    bottomLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [self.contentView addSubview:bottomLine];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@(SINGLE_LINE_WIDTH));
    }];
    
}
@end
