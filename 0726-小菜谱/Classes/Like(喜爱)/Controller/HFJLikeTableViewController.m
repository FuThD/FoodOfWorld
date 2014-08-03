//
//  HFJLikeTableView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJLikeTableViewController.h"
#import "HFJMainCell.h"
#import "HFJDishViewController.h"

@interface HFJLikeTableViewController()



@end

@implementation HFJLikeTableViewController

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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning ID是否可以和Good/search/cuisine的设置一样的? 待加数据后测试
    static NSString *ID = @"Like";
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    cell.textLabel.text = @"111";
    cell.detailTextLabel.text = @"222";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 将控制器添加到父控制器
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];

    [self.navigationController pushViewController:dishVC animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    dishVC.title = cell.textLabel.text;
    
    
}
@end
