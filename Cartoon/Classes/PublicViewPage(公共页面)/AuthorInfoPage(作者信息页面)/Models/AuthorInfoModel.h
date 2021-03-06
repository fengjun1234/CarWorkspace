//
//  AuthorInfoModel.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "BaseModel.h"
#import "topicModel.h"

//"android": "http://caidan.manyule.com/mobile/download?type=android",
//"avatar_url": "http://i.kuaikanmanhua.com/image/150706/hic40eurt.jpg-w180",
//"grade": 1,
//"id": 641190,
//"ios": "https://appsto.re/cn/6YNo4.i",
//"nickname": "\u597d\u6f2b\u753b",
//"pub_feed": 0,
//"reg_type": "author",
//"site": "http://bbs.manyule.com",
//"topics": [{
//    
//}],
//"update_remind_flag": 1,
//"wechat": "mycomic2015",
//"weibo": "http://weibo.com/haocomic",
//"weibo_name": "\u597d\u6f2b\u753b\u6742\u5fd7"

@interface AuthorInfoModel : BaseModel

@property (nonatomic,copy)   NSString *avatar_url;

@property (nonatomic,strong) NSNumber *bind_phone;

@property (nonatomic,strong) NSNumber *grade;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *intro;

@property (nonatomic,copy)   NSString *ios;

@property (nonatomic,copy)   NSString *nickname;

@property (nonatomic,strong) NSNumber *pub_feed;

@property (nonatomic,copy)   NSString *reg_type;

@property (nonatomic,copy)   NSString *site;

@property (nonatomic,strong) NSArray  *topics;

@property (nonatomic,strong) NSNumber *update_remind_flag;

@property (nonatomic,copy)   NSString *wechat;

@property (nonatomic,copy)   NSString *weibo_name;



@end
