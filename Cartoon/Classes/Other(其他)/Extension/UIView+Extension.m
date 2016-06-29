//
//  UIView+Extension.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "UIView+Extension.h"

@implementation UIView (Extension)


- (void)cornerRadius:(CGFloat)size
{
    if (size == 0) size = self.height * 0.5;
    
    self.layer.cornerRadius = size;
    self.layer.masksToBounds = YES;
    
}

- (id)findResponderWithClass:(Class)aclass
{
    UIResponder *nextResponder = self.nextResponder;
    
    while (nextResponder) {
        
        if ([nextResponder isKindOfClass:aclass]) {
            return nextResponder;
        }
        
        nextResponder = nextResponder.nextResponder;
    }
    
    return nil;
}






- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect newFrame = self.frame;
    newFrame.origin.x = x;
    self.frame = newFrame;
}
- (void)setY:(CGFloat)y {
    CGRect newFrame = self.frame;
    newFrame.origin.y = y;
    self.frame = newFrame;
}
- (void)setWidth:(CGFloat)width {
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}
- (void)setHeight:(CGFloat)height {
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

@end
