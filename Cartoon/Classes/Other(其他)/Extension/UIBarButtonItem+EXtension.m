//
//  UIBarButtonItem+EXtension.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "UIBarButtonItem+EXtension.h"

@implementation UIBarButtonItem (EXtension)


+ (instancetype)barButtonItemWithImage:(NSString *)image
                            pressImage:(NSString *)pressImage
                                target:(id)target action:(SEL)action
{
    return [[[self class] alloc] initWithImage:image pressImage:pressImage target:target action:action];
}
- (instancetype)initWithImage:(NSString *)image
                   pressImage:(NSString *)pressImage
                       target:(id)target action:(SEL)action
{
    
    UIButton *btn = [UIButton new];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:pressImage] forState:UIControlStateSelected];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    
    return [self initWithCustomView:btn];
}
@end
