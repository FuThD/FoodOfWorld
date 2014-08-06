//
//  CPBestCell.m
//  Best
//
//  Created by 李建平 on 14-8-5.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "CPBestCell.h"
#import "CPData.h"

@interface CPBestCell()

/** 菜肴参考图 */
@property (nonatomic, weak) UIImageView *imgView;

/** 菜肴标题 */
@property (nonatomic, weak) UILabel *titleLabel;

@end


@implementation CPBestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.创建视图
        [self setupCell];
        
    }
    return self;
}


- (void)setupCell
{
    //1.1创建预览视图
    UIImageView *imgView = [[UIImageView alloc] init];
    // 1.设置属性
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.clipsToBounds = YES;
    
//    imgView.backgroundColor = [UIColor redColor];
    //1.2设置imgView的frame
    CGFloat imgViewX = 25;
    CGFloat imgViewY = 5;
    CGFloat imgViewW = 270;
    CGFloat imgViewH = 125;
    
    imgView.frame = CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH);
    
    //1.3将空间添加到父视图
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    
    //2.1
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:211/255.0 alpha:0.3];
    
    //2.2
    CGFloat titleViewW = 270;
    CGFloat titleViewH = 25;
    CGFloat titleViewX = 25;
    CGFloat titleViewY = self.contentView.height - titleViewH;
    
    
    titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
    [self.contentView addSubview:titleView];

    
    //3.1创建Label视图
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor redColor];
    
    //3.2设置frame
    CGFloat titleLabelX = 0;
    CGFloat titleLabelY = 0;
    CGFloat titleLabelW = 270;
    CGFloat titleLabelH = 25;
    
    titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    //3.3将此视图添加到父视图
    [titleView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)setData:(CPData *)data
{
    _data = data;
    
    self.titleLabel.text = self.data.title;
    
    //1.拿到url
    NSURL *url = [NSURL URLWithString:self.data.albums[0]];
    
    //2.设置图片
    [self.imgView sd_setImageWithURL:url placeholderImage:nil];
}

+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    // 1.定义一个标识
    static NSString *ID = @"cell";
    
    // 2.去缓存池中取出可循环利用的cell
    CPBestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果缓存中没有可循环利用的cell
    if (cell == nil) {
        
        cell = [[CPBestCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


@end
