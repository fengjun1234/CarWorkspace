//
//  NSTimer+Control.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang
#import <objc/runtime.h>
#import "NSTimer+Control.h"

@implementation NSTimer (Control)



+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)())block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(block_blockInvoke:) userInfo:[block copy] repeats:repeats];
}



+ (void)block_blockInvoke:(NSTimer *)timer {
       if (!timer.isValid) return;
       void (^block)() = timer.userInfo;
    
        if (block) block();
}


- (void)begin {
    self.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
}

- (void)pause {
    self.fireDate = [NSDate distantFuture];
}



@end
