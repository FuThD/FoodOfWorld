//
//  HFJSearchController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchTableViewController.h"

@interface HFJSearchTableViewController ()

@end

@implementation HFJSearchTableViewController

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


// 开始拖拽表格
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:)]) {
        
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"search";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"123";
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:)]) {
        
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self];
    }


}




@end
