//
//  FTDJMainCell.m
//  0726-小菜谱
//
//  Created by FTDjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJMainCell.h"
#import "SWTData.h"

@interface FTDJMainCell()
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

@implementation FTDJMainCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:( NSString *)identifier
{
    FTDJMainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FTDJMainCell" owner:nil options:nil] lastObject];
    }
    
    // 设置cell的选中状态和图片切圆角
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.menuIcon.layer.cornerRadius = 5;
    cell.menuIcon.clipsToBounds = YES;
    
    return cell;

}

- (void)awakeFromNib{}

// 重写数据的set方法
- (void)setData:(SWTData *)data
{
    _data = data;
    
    // 设置cell的头像,和标题,描述性文字
    self.menuTitle.text = data.title;
    self.menuBurden.text = data.imtro;
    
    [self.menuIcon sd_setImageWithURL:data.albums[0] placeholderImage:[UIImage imageNamed:@"placeholder_Pic"]];

}



@end
