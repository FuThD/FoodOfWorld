//
//  HFJSearchResultController.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchResultController.h"
#import "HFJMainCell.h"

@interface HFJSearchResultController ()

@end

@implementation HFJSearchResultController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 提醒加载数据
    [MBProgressHUD showMessage:@"正在加载中..."];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (!self.dataList.count) {
            
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"网络有点不给力, 请稍后在试..."];
        }
        
    });

}

// 重写数据数组的set方法
- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    
    // 刷新数据
    [self.tableView reloadData];
    
    // 隐藏蒙版
    [MBProgressHUD hideHUD];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"searchResult";
    
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    NSDictionary *dict = self.dataList[indexPath.row];
    
    cell.dict = dict;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{




}

@end
