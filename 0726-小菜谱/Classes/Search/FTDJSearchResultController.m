//
//  FTDJSearchResultController.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJSearchResultController.h"
#import "FTDJMainCell.h"
#import "SWTData.h"
#import "FTDJDishViewController.h"

@interface FTDJSearchResultController ()<UIAlertViewDelegate>



@end

@implementation FTDJSearchResultController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.dataList.count) {
        
        // 提醒加载数据
        [MBProgressHUD showMessage:@"正在加载中..."];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 如果表格没有数据
        if (!self.dataList.count) {
            
            //  如果网络延迟了10秒, 隐藏viewWillAppear蒙版
            [MBProgressHUD hideHUD];
            
            // 如果没有数据, 就显示图片,提示客户网络问题/没搜到菜谱
            [self.tableView addSubview:self.imageView];
        }
    });
}

// 重写数据数组的set方法
- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    
    // 有数据就不显示图片
    [self.imageView removeFromSuperview];
    
    // 刷新数据
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 隐藏viewWillAppear蒙版
    [MBProgressHUD hideHUD];
    
    static NSString *ID = @"searchResult";
    
    FTDJMainCell *cell = [FTDJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    // 取得模型, 设置数据
    SWTData *data = self.dataList[indexPath.row];
    cell.data = data;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取得模型, 设置数据
    SWTData *data = self.dataList[indexPath.row];

    // push出Dish控制器
    FTDJDishViewController *dish = [[FTDJDishViewController alloc] init];
    dish.foodModel = data;
  
    // push出控制器
    [self.navigationController pushViewController:dish animated:YES];
}

#pragma mark - UIAlertViewDelegate 代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 如果点击了确定, 就放回上一级控制器
    if (buttonIndex == 0) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noweb"]];
        
        _imageView.center = self.tableView.center;
        _imageView.centerY -= 50;

    }
    return _imageView;
}

@end
