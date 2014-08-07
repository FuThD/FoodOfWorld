//
//  SWTFrameModel.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTFrameModel.h"
#import "CPStep.h"

#define margin 10

@implementation SWTFrameModel

- (void)setStepModel:(CPStep *)stepModel
{
    _stepModel = stepModel;
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    // 设置图像Frame
    // 配图
    CGFloat picW = 280;
    CGFloat picH = 200;
    CGFloat picX = (viewSize.width - picW) * 0.5;
    CGFloat picY = margin;
    _picF = CGRectMake(picX, picY, picW, picH);
    
    // 文字
    CGFloat descX = picX;
    CGFloat descY = CGRectGetMaxY(_picF) + margin;
    CGFloat descW = viewSize.width - 2 * descX;
    CGSize descSize = [stepModel.step sizeWithFont:SWTFrameModelDescFont constrainedToSize:CGSizeMake(descW, MAXFLOAT)];
    _descF = CGRectMake(descX, descY, descW, descSize.height);
    
    // 高度
    _height = CGRectGetMaxY(_descF) + margin;
}

@end
