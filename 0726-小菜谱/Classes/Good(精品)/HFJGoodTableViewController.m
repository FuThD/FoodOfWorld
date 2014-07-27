//
//  HFJGoodTableView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJGoodTableViewController.h"
#import "HFJMainCell.h"

@interface HFJGoodTableViewController()


@end

@implementation HFJGoodTableViewController

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
    
    // 设置frame
    self.tableView.y = 0;
    self.tableView.height = HFJViewFrame.size.height;
    self.tableView.width = HFJViewFrame.size.width;
    
    // 取消拖拽边界的弹簧效果
    self.tableView.bounces = NO;
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Good";
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];

    cell.textLabel.text = @"123";
    cell.detailTextLabel.text = @"abc";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    


}

@end
