//
//  ZWStepCell.h
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

// 显示 步骤的cell

#import <UIKit/UIKit.h>
@class SWTFrameModel;

@interface SWTStepCell : UITableViewCell

@property (nonatomic, strong) SWTFrameModel *frameModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
