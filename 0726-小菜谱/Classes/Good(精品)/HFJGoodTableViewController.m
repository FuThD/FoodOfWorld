//
//  HFJGoodTableView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJGoodTableViewController.h"
#import "HFJMainCell.h"
#import "HFJDishViewController.h"
#import "HFJHttpTool.h"


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
    
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
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
    // 将控制器添加到父控制器
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    
    [self.navigationController pushViewController:dishVC animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    dishVC.title = cell.textLabel.text;
    
//    NSString *url = @"http://apis.juhe.cn/cook/category?key=d042fccba82da1d6e93f5f2e67215568";
//    NSDictionary *params = @{@"key": HFJAppkey};
//    
//    [HFJHttpTool getWithUrl:url params:params success:^(id json) { 
//        
//        NSLog(@"%@", json);
//        
//    } failure:^(NSError *error) {
//        
//        NSLog(@"%@", error);
//    }];
    
    
    
}

@end
