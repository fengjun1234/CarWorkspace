//
//  CommentsModel.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "BaseModel.h"
/*
{
"comic_id": 12020,
"content": "\u554a\u554a\u554a\uff0c\u6709\u5f20\u56fe\u3002\u3002\u3002\u3002\u3002\u3002\ud83d\ude31\ud83d\ude31\ud83d\ude31",
"created_at": 1462607580,
"id": 28280239,
"is_liked": false,
"likes_count": 1,
"replied_comment_id": 0,
"replied_user_id": 0,
"user": {
				"avatar_url": "http://i.kuaikanmanhua.com/image/160504/7c5vo3vca.webp-w180.w",
				"id": 11852450,
				"nickname": "\u8471\u7237\u7237",
				"reg_type": "qq"
}
*/

#import "userModel.h"


@interface CommentsModel : BaseModel

@property (nonatomic,strong) NSNumber *comic_id;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *content;

@property (nonatomic)        BOOL is_liked;

@property (nonatomic,strong) NSNumber *likes_count;

@property (nonatomic,strong) NSNumber *replied_comment_id;

@property (nonatomic,strong) NSNumber *replied_user_id;

@property (nonatomic,strong) userModel *user;

@end
