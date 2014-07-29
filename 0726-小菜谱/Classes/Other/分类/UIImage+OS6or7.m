//
//  UIImage+OS6or7.m
//  0706-itcastWeiBo
//
//  Created by hfjflydove on 14-7-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+OS6or7.h"

@implementation UIImage (OS6or7)

//+ (instancetype)imageWithNamed:(NSString *)name
//{
//    // 0.定义返回的对象
//    UIImage *image = nil;
//    // 1.判断是否是iOS7
//    if (iOS7) {
//        // 要在图片名称后面拼接_os7
//        NSString *iOS7Name = [name stringByAppendingString:@"_os7"];
//        image = [UIImage imageNamed:iOS7Name];
//    }
//    // 2.判断图片是否为nil(因为有的图片是iOS67通用, 没有_os7结尾的图片)
//    if (image == nil) {
//        image = [UIImage imageNamed:name];
//    }
//    // 3.返回图片
//    return image;
//}


+ (instancetype)resizableImageNamed:(NSString *)name
{
    return [self resizableImageNamed:name left:0.5 top:0.5];
}

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)leftRatio top:(CGFloat)topRatio
{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

@end
