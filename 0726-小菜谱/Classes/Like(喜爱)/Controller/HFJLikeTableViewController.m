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
    
    // 设置frame
    self.tableView.y = 0;
    self.tableView.height = HFJViewFrame.size.height;
    self.tableView.width = HFJViewFrame.size.width;
    
    // 取消拖拽边界的弹簧效果
    self.tableView.bounces = NO;
    
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
    cell.textLabel.text = @"789";
    cell.detailTextLabel.text = @"hij";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 将控制器添加到父控制器
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    [self.parentViewController addChildViewController:dishVC];
    
    // view添加到根View上面
    [self.view.superview.superview addSubview:dishVC.view];
    

    
    
}
@end
