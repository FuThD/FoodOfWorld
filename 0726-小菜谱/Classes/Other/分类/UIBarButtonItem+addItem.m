//
//  UIBarButtonItem+addItem.m
//  0706-itcastWeiBo
//
//  Created by hfjflydove on 14-7-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIBarButtonItem+addItem.h"

@implementation UIBarButtonItem (addItem)

+ (UIBarButtonItem *)itemImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    // 1.创建一个UIButton
    UIButton *btn = [[UIButton alloc] init];
    // 设置默认状态图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // 设置高亮状态图片
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    // 设置size
    btn.size = btn.currentImage.size;
    
//    MyLog(@"%@,%@", @"UIBarButtonItem+addItem.h", self.);
    
    // 监听点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 生成UIBarButtonItem
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
