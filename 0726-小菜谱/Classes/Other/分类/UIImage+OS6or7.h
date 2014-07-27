//
//  UIImage+OS6or7.h
//  0706-itcastWeiBo
//
//  Created by hfjflydove on 14-7-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OS6or7)


/**
 *  创建一个已经适配好了iOS67的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)imageWithNamed:(NSString *)name;

/**
 *  创建一个拉伸不变形的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)resizableImageNamed:(NSString *)name;

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
