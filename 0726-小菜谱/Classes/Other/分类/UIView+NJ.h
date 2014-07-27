//
//  UIView+NJ.h
//  传智微博
//
//  Created by apple on 14-7-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NJ)

// 只会生成方法的声明, 不会生成方法的实现和成员变量
@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;


@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

@property(nonatomic,assign) CGSize size;

@end
