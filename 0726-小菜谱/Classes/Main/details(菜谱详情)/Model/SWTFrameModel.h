//
//  SWTFrameModel.h
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SWTFrameModelDescFont [UIFont systemFontOfSize:17]


@class CPStep;
@interface SWTFrameModel : NSObject
// 步骤模型
@property (nonatomic, strong) CPStep *stepModel;
// 配图
@property (nonatomic, assign, readonly) CGRect picF;
// 步骤
@property (nonatomic, assign, readonly) CGRect descF;
// 高度
@property (nonatomic, assign, readonly) CGFloat height;
@end
