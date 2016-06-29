
//
//  UIImage+Extension.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "UIImage+Extension.h"

@implementation UIImage (Extension)



- (UIImage *)clipImageToSize:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    CGSize imgSize = self.size;
    CGFloat x = MAX(size.width / imgSize.width, size.height / imgSize.height);
    CGSize resultSize = CGSizeMake(x* imgSize.width, x* imgSize.height);
    
    [self drawInRect:CGRectMake(0, 0, resultSize.width, resultSize.height)];
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
    
}

@end
