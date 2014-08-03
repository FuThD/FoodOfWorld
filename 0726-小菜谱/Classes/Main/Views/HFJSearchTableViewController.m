//
//  HFJSearchController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchTableViewController.h"
#import "HFJSearchHeadView.h"
#import "HFJHistoryCacheTool.h"
#import "HFJSearchCell.h"


@interface HFJSearchTableViewController ()<HFJSearchHeadViewDelegate>

/**
 *  推荐搜索菜品
 */
@property (nonatomic, strong) NSArray *recommendedMenu;

/**
 *  表格的数据数组
 */
@property (nonatomic, strong) NSArray *menuList;


@end

@implementation HFJSearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 表格的下边,内边距设置为10
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
 
    // 设置tableView头部标题以及他的代理
    self.tableView.tableHeaderView = self.headView;
    self.headView.delegate = self;
    
    // 去除cell垂直方向的指示线
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 简单粗暴的指定几个推荐搜索菜品
     self.recommendedMenu = @[@"西米露", @"红烧肉", @"西瓜", @"小龙虾", @"土豆排骨", @"粥", @"苦瓜", @"油焖大虾"];


}


// 开始拖拽表格
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:searchText:)])
    {
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self searchText:nil];
    }
}

#pragma mark - Table view data source / delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"search";
    HFJSearchCell *cell = [HFJSearchCell cellWithTableView:tableView reuseIdentifier:ID];
    
    // 设置cell的选中状态为灰色
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.text = self.menuList[indexPath.row];
    
    return cell;
}


// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 调用代理方法, 关闭键盘 如果没有搜索数据,并搜索推荐搜索的内容
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:searchText:)])
    {
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self searchText:self.menuList[indexPath.row]];
    }
}

#pragma mark - HFJSearchHeadViewDelegate 代理方法
// 点击了清理记录按钮
- (void)searchHeadView:(HFJSearchHeadView *)searchHeadView didClickClearBtn:(UIButton *)clearBtn
{
    // 清理历史搜索记录
    [HFJHistoryCacheTool clearHistorySearchKeyWord];
    [self.historyMenuList removeAllObjects];
    [self.tableView reloadData];

}
// 点击了segmentControl
- (void)searchHeadView:(HFJSearchHeadView *)searchHeadView didSelectedIndex:(int)index
{
    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:searchText:)])
    {
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self searchText:nil];
    }
    
    
    // segmentControl选中的1
    if (index == 1) {
        
        //  显示历史记录
        self.menuList = self.historyMenuList;
        
    }else{
        
        self.menuList = self.recommendedMenu;
    }
    
    // 刷新表格
    [self.tableView reloadData];
}

#pragma mark - 懒加载
- (HFJSearchHeadView *)headView
{
    if (_headView == nil) {
        _headView = [HFJSearchHeadView searchHeadView];
    }
    return _headView;
}

- (NSMutableArray *)historyMenuList
{
    if (_historyMenuList == nil) {

        // 从数据库取数据
        _historyMenuList = [HFJHistoryCacheTool searchKeyWord];
    }
    return _historyMenuList;
}

- (NSArray *)menuList
{
    if (_menuList == nil) {
        
        _menuList = self.recommendedMenu;
    }
    return _menuList;
}

@end
