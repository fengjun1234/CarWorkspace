//
//  bannerModel.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "BaseModel.h"
//
//"pic": "http://i.kuaikanmanhua.com/image/160503/12xa20na7.webp-w750",
//"title": "",
//"type": 3,
//"value": "11760"

@interface bannerModel : BaseModel

@property (nonatomic,copy) NSString *pic;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) NSNumber *type;

@property (nonatomic,copy) NSString *value;

@end
