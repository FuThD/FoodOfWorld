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
    
    // 取消拖拽边界的弹簧效果
    self.tableView.bounces = NO;
    
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;

}




@end
