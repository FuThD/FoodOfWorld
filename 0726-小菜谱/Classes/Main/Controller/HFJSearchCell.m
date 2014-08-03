//
//  HFJSearchCell.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchCell.h"

@implementation HFJSearchCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)identifier
{
    HFJSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HFJSearchCell" owner:nil options:nil] lastObject];
    }
    
    // 设置cell的选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}

@end
