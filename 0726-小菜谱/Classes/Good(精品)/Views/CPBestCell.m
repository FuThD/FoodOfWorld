 //
//  CPBestCell.m
//  Best
//
//  Created by 李建平 on 14-8-5.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "CPBestCell.h"
#import "SWTData.h"

@interface CPBestCell()

/** 菜肴参考图 */
@property (weak, nonatomic) IBOutlet UIImageView *menuImageView;

/** 菜肴标题 */
@property (weak, nonatomic) IBOutlet UILabel *menuTitle;

/** 菜肴标题的view */
@property (weak, nonatomic) IBOutlet UIView *menuTitleView;

@end


@implementation CPBestCell

- (void)awakeFromNib
{
    // 设置cell子视图的属性
    [self setupCell];
}

 // 设置cell子视图的属性
- (void)setupCell
{
    // 头像属性
    self.menuImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.menuImageView.clipsToBounds = YES;
    self.menuImageView.layer.cornerRadius = 5;

    // 标题容器属性
    self.menuTitleView.backgroundColor = [UIColor colorWithRed:121/255.0 green:121/255.0 blue:121/255.0 alpha:0.3];
    self.menuTitleView.clipsToBounds = YES;
    self.menuTitleView.layer.cornerRadius = 5;

    // 标题属性
    self.menuTitle.textAlignment = NSTextAlignmentLeft;
    self.menuTitle.textColor = [UIColor whiteColor];
    self.menuTitle.shadowColor = [UIColor blackColor];
    self.menuTitle.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:19];  // 粗体
    self.menuTitle.shadowOffset =  CGSizeMake(1, 1);
    
}

- (void)setData:(SWTData *)data
{
    _data = data;
    
    // 设置图片和标题
    self.menuTitle.text = self.data.title;
    [self.menuImageView sd_setImageWithURL:self.data.albums[0] placeholderImage:[UIImage imageNamed:@"placeholder_Pic"]];
    
}

+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    // 1.定义一个标识
    static NSString *ID = @"BestCell";
    
    // 2.去缓存池中取出可循环利用的cell
    CPBestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果缓存中没有可循环利用的cell
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CPBestCell" owner:nil options:nil] lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
