//
//  UIBarButtonItem+addItem.h
//  0706-itcastWeiBo
//
//  Created by hfjflydove on 14-7-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (addItem)

/**
 *  创建图片按钮  导航栏的左右按钮
 *
 *  @param image            图片按钮默认状态的图片
 *  @param highlightedImage 图片按钮高亮状态的图片
 *  @param action           监听图片按钮点击时间
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;

@end
