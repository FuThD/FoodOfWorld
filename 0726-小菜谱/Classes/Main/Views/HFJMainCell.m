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
    }
    
    // 设置cell的选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;

}

- (void)awakeFromNib{}

// 重写数据的set方法
- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;

    self.menuTitle.text = dict[@"title"];
    self.menuBurden.text = dict[@"imtro"];
    [self.menuIcon sd_setImageWithURL:dict[@"albums"][0] placeholderImage:[UIImage imageNamed:@"placeholder_Pic"]];
}



@end
