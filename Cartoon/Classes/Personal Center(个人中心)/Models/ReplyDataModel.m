//
//  ReplyCommentsModel.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "ReplyDataModel.h"

@implementation TargetCommentModel

@end

@implementation TargetComicModel

@end

@implementation ReplyCommentsModel

+ (NSDictionary *)mj_objetctClassInArray {
    return @{@"target_comic":[TargetComicModel class],
             @"target_comment":[TargetCommentModel class]};
}

@end

@implementation ReplyDataModel


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"comments":[ReplyCommentsModel class]};
}

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}

@end
