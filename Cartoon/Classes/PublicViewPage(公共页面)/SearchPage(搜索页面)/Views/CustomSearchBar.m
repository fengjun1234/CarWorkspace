//
//  CustomSearchBar.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import "CustomSearchBar.h"
#import "UIView+Extension.h"
#import "CommonMacro.h"


@interface CustomSearchBar ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *placeBtnCenterX;

@property (weak, nonatomic) IBOutlet UIButton *placeBtn;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CustomSearchBar



+ (instancetype)makeCustomSearchBar {
    return [[[NSBundle mainBundle] loadNibNamed:@"CustomSearchBar" owner:nil options:nil] firstObject];
}

- (void)changeSearchText:(NSString *)text {
    self.textField.text = text;
    [self beginOrEndEditing:YES];
    [self textFieldDidChange:self.textField];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = subjectColor;
    self.textField.delegate = self;
    [self setTextFieldLeftPadding:self.textField forWidth:25];
    
}



- (IBAction)textFieldDidChange:(id)sender {
    self.placeBtn.titleLabel.hidden = self.textField.text.length > 0;
    if ([self.delegate respondsToSelector:@selector(customSearchBar:textDidChange:)]) {
        [self.delegate customSearchBar:self textDidChange:self.textField.text];
    }
    
}

- (IBAction)cancal:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(customSearchBarNeedDisMiss:)]) {
        [self.delegate customSearchBarNeedDisMiss:self];
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self beginOrEndEditing:YES];
    if ([self.delegate respondsToSelector:@selector(customSearchBarDidBeginEditing:)]) {
        [self.delegate customSearchBarDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.textField.text.length < 1) {
        [self beginOrEndEditing:NO];
    }
}



- (void)beginOrEndEditing:(BOOL)isbegin {
    
    CGFloat offset = (self.textField.width - self.placeBtn.width) * 0.5;
    
    CGFloat constant = isbegin ? offset : 0;
    
    self.placeBtnCenterX.constant = -constant;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

-(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth
{
    CGRect frame = textField.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftview;
}

- (BOOL)becomeFirstResponder {
    return [self.textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self.textField resignFirstResponder];
    return [super resignFirstResponder];
}

@end
