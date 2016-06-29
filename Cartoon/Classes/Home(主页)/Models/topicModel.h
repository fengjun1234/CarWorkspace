//
//  topicModel.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import <Foundation/Foundation.h>
#import "userModel.h"
#import "BaseModel.h"

@interface topicModel : BaseModel

@property (nonatomic,copy)   NSString *vertical_image_url;

@property (nonatomic,copy)   NSString *desc;

@property (nonatomic,copy)   NSString *title;

@property (nonatomic,strong) NSNumber *created_at;

@property (nonatomic,strong) NSNumber *updated_at;

@property (nonatomic,strong) NSNumber *order;

@property (nonatomic,strong) NSNumber *label_id;

@property (nonatomic,strong) userModel *user;

@property (nonatomic,copy)   NSString *cover_image_url;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,strong) NSNumber *comics_count;

@property (nonatomic,copy)   NSString *discover_image_url;


@end
