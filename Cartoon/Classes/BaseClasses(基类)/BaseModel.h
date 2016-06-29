//
//  BaseModel.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@class UIView;

typedef NS_ENUM(NSUInteger, ModelDataCachingPolicy) {
    ModelDataCachingPolicyDefault,  //使用内存缓存 保存进内存
    ModelDataCachingPolicyReload,   //不是用内存缓存 但是更新内存缓存
    ModelDataCachingPolicyNoCache,
};


@interface BaseModel : NSObject  <MJCoding,MJKeyValue>

+ (NSArray <NSString *>*)setupDataFieldsIsModelArray:(BOOL *)isModelArray;


+ (void)requestModelDataWithUrlString:(NSString *)urlString
                             complish:(void (^)(id))complish
                             cachingPolicy:(ModelDataCachingPolicy)cachingPolicy
                             hubInView:(UIView *)view;  //如果传nil使用keywindow


@end
