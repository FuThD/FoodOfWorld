//
//  FTDJSearchController.h
//  0726-小菜谱
//
//  Created by FTDjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  搜索视图里面的tableView控制器

#import <UIKit/UIKit.h>
@class FTDJSearchTableViewController, FTDJSearchHeadView;

@protocol FTDJSearchTableViewControllerDelegate <NSObject>

// 代理通知代理方关闭键盘, 传递点击的推荐搜索的内容
- (void)searchControllerBeginDraggingORDidSelectedCell:(FTDJSearchTableViewController *)searchTableViewController searchText:(NSString *)menu;

@end

@interface FTDJSearchTableViewController : UITableViewController

@property (nonatomic, weak) id<FTDJSearchTableViewControllerDelegate>  searchDelegate;

// tableView的头部view
@property (nonatomic, strong) FTDJSearchHeadView *headView;

/**
 *  历史搜索记录数据数组
 */
@property (nonatomic, strong) NSMutableArray *historyMenuList;



@end
