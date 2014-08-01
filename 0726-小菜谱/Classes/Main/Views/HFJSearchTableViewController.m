//
//  HFJSearchController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchTableViewController.h"
#import "HFJMainCell.h"
#import "HFJSearchHeadView.h"
#import "HFJDish.h"

@interface HFJSearchTableViewController ()<HFJSearchHeadViewDelegate>

/**
 *  菜谱表格数据数组
 */
@property (nonatomic, strong) NSArray *menuList;

/**
 *  推荐搜索菜品
 */
@property (nonatomic, strong) NSArray *recommendedMenu;


@end

@implementation HFJSearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headView;
    // 表格的下边,内边距设置为10
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
 
    // 设置tableView头部标题代理
    self.headView.delegate = self;
    
    // 去除cell的分割线
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    // 简单粗暴的指定几个推荐搜索菜品
    self.recommendedMenu = @[@{@"title":@"西米露", @"burden":@"温中健脾，治脾胃虚弱、和消化不良的功效", @"albums": @[@"http://img.juhe.cn/cookbook/t/22/21832_980436.jpg"]}, @{@"title":@"西瓜", @"burden":@"清热解暑、生津止渴、利尿除烦", @"albums": @[@"http://img.juhe.cn/cookbook/t/3/3035_694440.jpg"]}, @{@"title":@"粥", @"burden":@"夏天没胃口,那就来碗粥吧", @"albums": @[@"http://img.juhe.cn/cookbook/t/4/3090_420856.jpg"]}, @{@"title":@"红烧肉", @"burden":@"肥瘦相间，香甜松软，入口即化", @"albums": @[@"http://img.juhe.cn/cookbook/t/1/92_512827.jpg"]}, @{@"title":@"小龙虾", @"burden":@"肉质肥美,香辣可口", @"albums": @[@"http://img.juhe.cn/cookbook/t/22/21832_980436.jpg"]},  @{@"title":@"苦瓜", @"burden":@"苦瓜具有降血糖、血脂、抗炎等作用", @"albums": @[@"http://img.juhe.cn/cookbook/t/1/746_256043.jpg"]}];
    
    self.menuList = self.recommendedMenu;
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
    
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    NSDictionary *dict = self.menuList[indexPath.row];
    
    cell.dict = dict;
    return cell;
    
}


// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 如果有搜索数据
    if (self.dataList.count) {
        
        // 调用代理方法, 关闭键盘
        if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:searchText:)])
        {
            [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self searchText:nil];
        }
        
        // 转跳到菜品的界面
        
        
        
    }else{
        
        // 调用代理方法, 关闭键盘 如果没有搜索数据,并搜索推荐搜索的内容
        if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:searchText:)])
        {
            [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self searchText:self.recommendedMenu[indexPath.row][@"title"]];
        }
    }
}

// 设置tableView头部的view
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return self.headView;
//}

// 设置tableView头部的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 50;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark - HFJSearchHeadViewDelegate 代理方法
// 点击了清理记录按钮
- (void)searchHeadView:(HFJSearchHeadView *)searchHeadView didClickClearBtn:(UIButton *)clearBtn
{    
#warning 检查加了数据库之后,是否有BUG
    // 清理历史搜索记录
    self.dataList = [NSArray array];
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
        self.menuList = self.dataList;
        
    }else{
        
        self.menuList = self.recommendedMenu;
    }
    
    // 刷新表格
    [self.tableView reloadData];
}


// 重写数据数组的set方法
- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    self.menuList = dataList;

    // 刷新数据
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

- (NSArray *)menuList
{
    if (_menuList == nil) {

        _menuList = [NSArray array];
    }
    return _menuList;
}



@end
