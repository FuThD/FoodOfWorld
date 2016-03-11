//
//  CPBestTableViewController.m
//  Best
//
//  Created by 李建平 on 14-8-5.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "CPBestTableViewController.h"
#import "CPBestCell.h"
#import "SWTData.h"
#import "FTDJDishViewController.h"
#import "NSDate+NJ.h"
#import "MJRefresh.h"

#define cellHeight 185
#define SWTBestCellCount 10

@interface CPBestTableViewController ()

/** 定义数组，保存所有的属性 */
@property (nonatomic, strong) NSArray *dataList;

/**
 *  用于存储随机选中的菜谱的头像url, 防止选出重复的
 */
@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation CPBestTableViewController

/** 懒加载 */
- (NSArray *)dataList
{
    if (!_dataList) {
    
        //1.获取plist地址
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"allFoodPlist.plist" ofType:nil];
        
        //2.取出数据
        NSArray *array = [NSArray arrayWithContentsOfFile:fullPath];
        
        //3.遍历数组 arrayM存得500个plist数据
        NSMutableArray *arrayM = [NSMutableArray array];     // 存模型
        
        for (NSArray *arr in array) {
            
            NSDictionary *dict = arr[0];
            
            SWTData *data = [SWTData dataWithDict:dict];
            
            [arrayM addObject:data];     // 存入模型
        }
        
        // 从500个数据里面随机抽取10个数据模型和10个字典
        NSMutableArray *dataArray = [NSMutableArray array];
        
        // 随机数据
        for (int i = 0; i < SWTBestCellCount; i++) {
            
            // 取一个随机数据
            int index = arc4random_uniform((int)arrayM.count / 10) * (i + 1);
            
            // 判断self.list是否包含index
            while ([self.list containsObject:[arrayM[index] albums][0]]) {
                
                index = index + 1;
                
                // 防止数组越界
                if (index == arrayM.count) {
                    index = 0;
                }
            }
            
            // 存到记录的数组
            SWTData *data = arrayM[index];
            [self.list addObject:data.albums[0]];
            
            [dataArray addObject:data];
        }
        
        // 清空记录的数组
        [self.list removeAllObjects];
        
        // 赋值字典数组
        _dataList = dataArray;
    }
    return _dataList;
}

- (void)viewDidLoad
{
  
    [super viewDidLoad];
   
    
    // 用MJ框架上拉刷新,
    [self.tableView addHeaderWithTarget:self action:@selector(refreshing)];
    
    //  加载新浪数据
    [self.tableView headerBeginRefreshing];
}

// 下拉刷新
- (void)refreshing
{
    self.dataList = nil;
    
    [self.tableView reloadData];
    
    [self.tableView headerEndRefreshing];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.创建自定义cell
    CPBestCell *cell = [CPBestCell cellWithTabelView:tableView];
    
    // 2.设置数据
    cell.data = self.dataList[indexPath.row];
    
    // 3.返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 跳转到下一个控制器
    FTDJDishViewController *dishVC = [[FTDJDishViewController alloc] init];
    
    // 取模型,数据
    SWTData *data = self.dataList[indexPath.row];
    dishVC.foodModel = data;

    // 退出控制器
    [self.navigationController pushViewController:dishVC animated:YES];
}


@end
