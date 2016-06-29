//
//  NetWorkTool.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "NetWorkManager.h"
#import "NSString+Extension.h"

@interface NetWorkManager ()


@end

@implementation NetWorkManager



- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                        url:(NSString *)url
                                 parameters:(id)parameters
                                   complish:(void (^)(id res,NSError *error))complish {
    
    NSParameterAssert(complish);
    
    
   NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:method URLString:url parameters:parameters uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
        
        if (complish) {
            complish(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (complish) {
            complish(nil,error);
        }
        
    }];
    
    [dataTask resume];
    
    return dataTask;
}




+ (instancetype)share
{
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetWorkManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.requestSerializer.timeoutInterval = 10;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
        [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring] ;
    
    }
    return self;
}

- (void)dealloc {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring] ;
}

- (BOOL)hasNetWork {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

@end
