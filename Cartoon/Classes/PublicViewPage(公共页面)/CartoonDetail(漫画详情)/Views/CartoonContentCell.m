//
//  CartoonContentCell.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "CartoonContentCell.h"

@implementation CartoonContentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        
        _content = imageView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.content.frame = self.bounds;
}

@end
