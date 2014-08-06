//
//  ZWHeaderView.h
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//
// 头部

#import <UIKit/UIKit.h>
@class CPData;
@interface SWTHeaderView : UIView
@property (nonatomic, strong) CPData *foodModel;
- (instancetype)initWithFoodModel:(CPData *)foodModel;
@end
