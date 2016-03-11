//
//  FTDJLikeTableView.m
//  0721- 小菜谱
//
//  Created by FTDjflydove on 14-7-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJLikeTableViewController.h"
#import "FTDJMainCell.h"
#import "FTDJDishViewController.h"
#import "FTDJCollectMenuTool.h"
#import "SWTData.h"


@interface FTDJLikeTableViewController()

/**
 *  提示用户收菜菜谱的图片
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 *  存放模型的数组
 */
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation FTDJLikeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 如果没有数据, 就显示一个推荐图片,否者不显示
    if (!self.dataList.count) {
        
        [self.tableView addSubview:self.imageView];
        
    }else{
        
        [self.imageView removeFromSuperview];
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *ID = @"Like";
    FTDJMainCell *cell = [FTDJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    SWTData *data = self.dataList[indexPath.row];
    cell.data = data;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 将控制器添加到父控制器
    FTDJDishViewController *dishVC = [[FTDJDishViewController alloc] init];
    
    // 取出数据赋值给dishVC
    SWTData *data = self.dataList[indexPath.row];
    dishVC.foodModel = data;

    [self.navigationController pushViewController:dishVC animated:YES];

}

/**
 *  界面即将要展示, 就获取数据库数据
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 读取数据库
    _dataList = [FTDJCollectMenuTool collectMenus];

    // 刷新表格
    [self.tableView reloadData];

    // 如果没有数据, 就显示一个推荐图片,否者不显示
    if (!self.dataList.count) {
        
        [self.tableView addSubview:self.imageView];
        
    }else{
        
        [self.imageView removeFromSuperview];        
    }
}


#pragma mark - 懒加载
- (NSArray *)dataList
{
    if (_dataList == nil) {
        
        _dataList = [NSArray array];
    }
    return _dataList;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {

        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiaitx"]];
        _imageView.center = self.tableView.center;
        _imageView.centerY -= 10;

    }
    return _imageView;
}


@end
