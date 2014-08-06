//
//  ZWStepCell.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTStepCell.h"
#import "CPStep.h"
#import "UIImageView+WebCache.h"
#import "SWTFrameModel.h"


@interface SWTStepCell ()
// 步骤配图
@property (nonatomic, weak) UIImageView *picView;
// 步骤描述
@property (nonatomic, weak) UILabel *descLabel;
@end

@implementation SWTStepCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 添加子控件
        // 步骤配图
        UIImageView *picView = [[UIImageView alloc] init];
        picView.layer.cornerRadius = 5;
        picView.clipsToBounds = YES;
        self.picView = picView;
        [self.contentView addSubview:picView];
        
        // 步骤描述
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.textColor = [UIColor blackColor];
        descLabel.font = SWTFrameModelDescFont;
        self.descLabel = descLabel;
        descLabel.numberOfLines = 0;
        descLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:descLabel];
    }
    return self;
}

// 传入模型
- (void)setFrameModel:(SWTFrameModel *)frameModel
{
    _frameModel = frameModel;
    CPStep *stepModel = _frameModel.stepModel;
    // 内容
    self.descLabel.text = stepModel.step;
    // 配图
    [self.picView sd_setImageWithURL:[NSURL URLWithString:stepModel.img] placeholderImage:[UIImage imageNamed:@"placeholder_Pic"]];
    
    // 设置frame
    // 步骤配图
    self.picView.frame = _frameModel.picF;
    // 步骤描述
    self.descLabel.frame= _frameModel.descF;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"stepCell";
    SWTStepCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[SWTStepCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


@end
