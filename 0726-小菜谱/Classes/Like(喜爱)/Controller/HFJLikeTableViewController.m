//
//  HFJLikeTableView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJLikeTableViewController.h"
//#import "HFJLikeDataSource.h"

@interface HFJLikeTableViewController()

//@property (nonatomic, strong) HFJLikeDataSource *likeDataSource;

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
    self.tableView.height = 480;
    self.tableView.width = 320;
    
    // 取消拖拽边界的弹簧效果
    self.tableView.bounces = NO;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Like";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"789";
    cell.detailTextLabel.text = @"hij";
    
    return cell;
}
@end
