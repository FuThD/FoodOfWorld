//
//  HFJMainCell.h
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPData;

@interface HFJMainCell : UITableViewCell

/**
 *  实例化一个cell
 *  @param ID        可从用标识符
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)ID ;

/**
 *  菜谱模型
 */
@property (nonatomic, strong) CPData *data;

@end
