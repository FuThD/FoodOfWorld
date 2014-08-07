//
//  HFJMainTableViewController.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJMainTableViewController.h"

@interface HFJMainTableViewController ()

@end

@implementation HFJMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置表格的y值
    self.tableView.y = 0;
    self.tableView.height = HFJViewHeight;

    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);

}




@end
