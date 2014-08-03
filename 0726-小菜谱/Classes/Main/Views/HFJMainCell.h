//
//  HFJMainCell.h
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFJMainCell : UITableViewCell

/**
 *  实例化一个cell
 *  @param ID        可从用标识符
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)ID ;


@property (nonatomic, strong) NSDictionary *dict;

@end
