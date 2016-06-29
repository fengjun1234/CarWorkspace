//
//  DateManager.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <Foundation/Foundation.h>


//@"yyyy-MM-dd HH:mm:ss.ff";

static NSString * const defautFormat = @"yyyy-MM-dd";

@interface DateManager : NSObject

@property (nonatomic,strong,readonly) NSDateFormatter *format;

//当前的时间
@property (nonatomic,readonly) NSDate *currentDate;

// 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
// 获取今天是星期几
@property (nonatomic,readonly) NSInteger currentWeek;

- (NSDate *)dateByTodayAddingDays: (NSInteger)dDays;

- (NSString *)timeStampWithDate:(NSDate *)date;
- (NSString *)timeWithTimeStamp:(NSInteger)timeStamp;

- (NSString *)conversionDate:(NSDate *)date;
- (NSString *)conversionDateVer2:(NSDate *)date;

+ (instancetype)share;

@end
