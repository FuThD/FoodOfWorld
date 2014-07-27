//
//  HFJSearchController.h
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  搜索视图里面的tableView控制器

#import <UIKit/UIKit.h>
@class HFJSearchTableViewController;

@protocol HFJSearchTableViewControllerDelegate <NSObject>

- (void)searchControllerBeginDraggingORDidSelectedCell:(HFJSearchTableViewController *)searchTableViewController;

@end

@interface HFJSearchTableViewController : UITableViewController

@property (nonatomic, weak) id<HFJSearchTableViewControllerDelegate>  searchDelegate;

@end
