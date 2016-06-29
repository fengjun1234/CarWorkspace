//
//  CommentSendViewContainer.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <UIKit/UIKit.h>

@class CommentsModel;
@class CommentSendViewContainer;

@protocol CommentSendViewContainerDelegate <NSObject>

@optional

- (void)sendMessageSucceeded:(CommentsModel *)commentContent;

@end


@interface CommentSendViewContainer : UIView

@property (nonatomic,strong) NSNumber *comicID;

@property (nonatomic,weak) id<CommentSendViewContainerDelegate> delegate;

+ (instancetype)showInView:(UIView *)view;
- (instancetype)initInView:(UIView *)view;

+ (instancetype)showWithComicID:(NSNumber *)ID inView:(UIView *)view;
- (instancetype)initWithComicID:(NSNumber *)ID inView:(UIView *)view;

- (void)replyWithUserName:(NSString *)nickName commentID:(NSNumber *)ID;

@end
