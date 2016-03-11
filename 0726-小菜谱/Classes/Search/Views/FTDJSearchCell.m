//
//  FTDJSearchCell.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJSearchCell.h"

@implementation FTDJSearchCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)identifier
{
    FTDJSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FTDJSearchCell" owner:nil options:nil] lastObject];
    }
    
    // 设置cell的选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    // 去除textlabel的背景色, 否者IOS6会有BUG
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

@end
