//
//  FTDJMainTableViewController.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJMainTableViewController.h"

@interface FTDJMainTableViewController ()

@end

@implementation FTDJMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置表格的y值
    self.tableView.y = 0;
    self.tableView.height = FTDJViewHeight; 
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"io6background"]];

    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 10, 0);
    
}




@end
