//
//  CPBestCell.h
//  Best
//
//  Created by 李建平 on 14-8-5.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWTData;

@interface CPBestCell : UITableViewCell

/**
 *  菜谱模型
 */
@property (nonatomic, strong) SWTData *data;

+ (instancetype)cellWithTabelView:(UITableView *)tableView;

@end
