//
//  CartoonFlooterView.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "CartoonFlooterView.h"
#import "comicsModel.h"


@interface CartoonFlooterView ()


@property (weak, nonatomic) IBOutlet UILabel *upNumber;

@property (nonatomic,assign) NSInteger upCount;

@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextPageBtn;
@property (weak, nonatomic) IBOutlet UIView *navView;

@end

@implementation CartoonFlooterView

+ (instancetype)makeCartoonFlooterView {
    return [[[NSBundle mainBundle] loadNibNamed:@"CartoonFlooterView" owner:nil options:nil] firstObject];
}

- (void)setUpCount:(NSInteger)upCount {
    _upCount = upCount;
    
    self.upNumber.text = [NSString stringWithFormat:@"赞 %zd",upCount];
    self.model.likes_count = [NSNumber numberWithInteger:upCount];
    
}

- (void)setModel:(comicsModel *)model {
    _model = model;
    

    self.upCount = model.likes_count.integerValue;
    
    BOOL hasPrevious = model.previous_comic_id != nil;
    BOOL hasNext = model.next_comic_id != nil;
    
    self.navView.hidden = hasPrevious == NO && hasNext == NO;
        
    self.previousBtn.enabled = hasPrevious;
    self.nextPageBtn.enabled = hasNext;

}




- (IBAction)ThumbsUp:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    btn.selected = !btn.selected;
    self.model.is_liked = !self.model.is_liked;
    if (btn.selected) {
        self.upCount += 1;
    }else{
        self.upCount -= 1;
    }
    
    
}
- (IBAction)comment:(id)sender {
    if ([self.delegate respondsToSelector:@selector(commentButtonAction)]) {
        [self.delegate commentButtonAction];
    }
}
- (IBAction)share:(id)sender {
    if ([self.delegate respondsToSelector:@selector(showShareView)]) {
        [self.delegate showShareView];
    }
}



- (IBAction)previous:(id)sender {
    if ([self.delegate respondsToSelector:@selector(previousPage)]) {
        [self.delegate previousPage];
    }
}
- (IBAction)nextPage:(id)sender {
    if ([self.delegate respondsToSelector:@selector(nextPage)]) {
        [self.delegate nextPage];
    }
}



@end
