//
//  CommentBottomView.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>

@protocol CommentBottomViewDelegate <NSObject>

@optional

- (void)textView:(UITextView *)textView ContenSizeDidChange:(CGSize)size;

- (void)showShareView;

- (void)showCommentPage;

- (void)sendMessage:(NSString *)message;

@end

@interface CommentBottomView : UIView

@property (nonatomic,assign) BOOL beginComment;

@property (nonatomic,assign) NSInteger recommend_count;

@property (nonatomic,weak) id<CommentBottomViewDelegate> delegate;

+ (instancetype)commentBottomView;

- (void)sendSucceeded;

@end
