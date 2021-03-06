
//
//  ModelCacheManager.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "ModelCacheManager.h"
#import "NSString+Extension.h"
#import "NetWorkManager.h"


@interface ModelCacheManager ()

@property (nonatomic,copy)   NSString *cacheDirectory;

@property (nonatomic,strong) NSFileManager *fileManager;

@property (nonatomic,strong) NSMutableDictionary *modelCache;

@end

@implementation ModelCacheManager


+ (instancetype)manager
{
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ModelCacheManager alloc] init];
    });
    
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
      NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        [center addObserver:self selector:@selector(saveCache) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [center addObserver:self selector:@selector(removeAllCache) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
        self.modelCache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)removeAllCache {
    [self.modelCache removeAllObjects];
}



- (id)cacheForKey:(NSString *)key {
    
    BOOL hasNetWork = [[NetWorkManager share] hasNetWork];
    
    id cache = [self.modelCache objectForKey:key];
    
    if (cache || hasNetWork) return cache;
    
    cache = [NSKeyedUnarchiver unarchiveObjectWithFile:[self cachePathForKey:key]];
    
    return cache;
}

- (void)setCache:(id)aCache forKey:(NSString *)aKey {
    [self.modelCache setObject:aCache forKey:aKey];
}

- (void)removeCacheForKey:(NSString *)key {
    [self.modelCache removeObjectForKey:key];
    
}

- (void)saveCache {
    
    [self.modelCache enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       BOOL succeeded = [NSKeyedArchiver archiveRootObject:obj toFile:[self cachePathForKey:key]];
        printf("保存磁盘对象%s\n",succeeded ? "成功" : "失败");
    }];
}

- (NSString *)cachePathForKey:(NSString *)key {
    return [self.cacheDirectory stringByAppendingPathComponent:key.md5_16];
}


- (NSString *)cacheDirectory {
    
    if (!_cacheDirectory) {
        
        _cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"com.kuaikan.cacheDirectory"];
        
        [self.fileManager createDirectoryAtPath:_cacheDirectory withIntermediateDirectories:NO attributes:nil error:nil];
       
    }
    return _cacheDirectory;
}

- (NSFileManager *)fileManager {
    if (!_fileManager) {
        _fileManager = [NSFileManager defaultManager];
    }
    return _fileManager;
}

@end
