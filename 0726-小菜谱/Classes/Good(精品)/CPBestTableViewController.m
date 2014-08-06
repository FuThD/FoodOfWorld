//
//  CPBestTableViewController.m
//  Best
//
//  Created by 李建平 on 14-8-5.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "CPBestTableViewController.h"
#import "CPBestCell.h"
#import "CPData.h"
#import "HFJDishViewController.h"

#define cellHeight 135
#define SWTBestCellCount 10

@interface CPBestTableViewController ()

/** 定义数组，保存所有的属性 */
@property (nonatomic, strong) NSArray *dataList;

/**
 *  存储数据模型的字典数组
 */
@property (nonatomic, strong) NSMutableArray *dictArray;

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
        NSMutableArray *dictArrayM = [NSMutableArray array]; // 存字典
        
        for (NSArray *arr in array) {
            
            NSDictionary *dict = arr[0];
            
            CPData *data = [CPData dataWithDict:dict];
            
            [dictArrayM addObject:dict]; // 存入模型
            [arrayM addObject:data];     // 存入模型
            
        }
        
        // 从500个数据里面随机抽取10个数据
        NSMutableArray *dataArray = [NSMutableArray array];
        
        for (int i = 0; i < SWTBestCellCount; i++) {
            
            // 随机数据
            int index = arc4random_uniform(arrayM.count);
            
            [dataArray addObject:arrayM[index]];
            [self.dictArray addObject:dictArrayM[index]];
        }
        
        _dataList = dataArray;
    }
    return _dataList;
}

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
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    
    // 取模型,数据
    CPData *data = self.dataList[indexPath.row];
    dishVC.foodModel = data;
    NSDictionary *dict = self.dictArray[indexPath.row];
    dishVC.dictData = dict;
    
    [self.navigationController pushViewController:dishVC animated:YES];
}


@end
