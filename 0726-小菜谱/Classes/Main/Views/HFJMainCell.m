//
//  HFJMainCell.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJMainCell.h"

@interface HFJMainCell()
/**
 *  菜品图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *menuIcon;
/**
 *  菜品名字
 */
@property (weak, nonatomic) IBOutlet UILabel *menuTitle;
/**
 *  菜品材料
 */
@property (weak, nonatomic) IBOutlet UILabel *menuBurden;

@end

@implementation HFJMainCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)identifier
{
    HFJMainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HFJMainCell" owner:nil options:nil] lastObject];
        
        cell.contentView.backgroundColor = [UIColor colorWithRed:250/255. green:250/255. blue:250/255. alpha:1];
        
    }
    
    return cell;

}

// 重写数据的set方法
- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;

    self.menuTitle.text = dict[@"title"];
    self.menuBurden.text = dict[@"burden"];

    // 如果有图片才加载图片
    if (dict[@"albums"]) {
        
        [self.menuIcon sd_setImageWithURL:dict[@"albums"][0] placeholderImage:[UIImage imageNamed:@"holder"]];
    }

}

@end
