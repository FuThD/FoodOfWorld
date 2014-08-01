//
//  HFJCuisineTableViewController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJCuisineTableViewController.h"
#import "HFJMainCell.h"
#import "HFJDishViewController.h"

@interface HFJCuisineTableViewController ()

@end

@implementation HFJCuisineTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = HFJBasicColor;
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cuisine";
    
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    cell.textLabel.text = @"0000";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 实例化菜品控制器
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    
    // 取出cell模型,设置dishVC的标题
    
    
    
    // push出控制器
    [self.navigationController pushViewController:dishVC animated:YES];

}









@end
