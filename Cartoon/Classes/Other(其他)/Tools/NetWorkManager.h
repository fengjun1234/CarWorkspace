//
//  NetWorkTool.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import <AFNetworking.h>

/*网络相关
 {result:ok, data:data}
 {result:error,message:""}
 {result:invalidatetoken, message:"token失效"}
 */


#define NetCode             @"code"
#define NetOk               @"OK"
#define NetData             @"data"
#define NetMessage          @"message"
#define HTTPSchema          @"http:"
#define HTTPGET             @"GET"
#define HTTPPOST            @"POST"

@interface NetWorkManager : AFHTTPSessionManager

@property (nonatomic,readonly) BOOL hasNetWork;


+ (instancetype)share;

- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                        url:(NSString *)url
                                 parameters:(id)parameters
                                   complish:(void (^)(id res,NSError *error))complish;


@end
