//
//  ZWFoodListViewController.m
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTFoodListViewController.h"
#import "AFNetworking.h"
#import "CPData.h"
#import "HFJMainCell.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "HFJDishViewController.h"


@interface SWTFoodListViewController ()
// 保存所有的食谱
@property (nonatomic, strong) NSMutableArray *foodList;
@property (nonatomic, assign) NSInteger pn;
@property (nonatomic, strong) NSArray *dictArray;
@end


@implementation SWTFoodListViewController
#pragma mark 懒加载
- (NSMutableArray *)foodList
{
    if(!_foodList)
    {
        _foodList = [NSMutableArray array];
        
        NSString *fileName = [NSString stringWithFormat:@"plist.bundle/category_%@.plist", _sortID];
        
        // 字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        self.dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典转模型
        for (NSDictionary *dict in self.dictArray) {
            [_foodList addObject:[CPData dataWithDict:dict]];
        }
    }
    return _foodList;
}

#pragma mark 传入分类ID
- (void)setSortID:(NSString *)sortID
{
    _sortID = sortID;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 加载对应类别的菜谱列表
//    [self loadFoodList];
    // 注册NIB
    UINib *nib = [UINib nibWithNibName:@"HFJMainCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MainCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
//    [self.tableView addFooterWithTarget:self action:@selector(loadMore)];
    
}

- (void)loadMore
{
    _pn = self.foodList.count;
    [self loadFoodList];
}

/**
 *  加载对应类别的菜谱列表
 */
- (void)loadFoodList
{
    // 操作管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 封装参数
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
    paramDict[@"key"] = HFJAppkey;
    paramDict[@"cid"] = _sortID;
    paramDict[@"pn"] = @(_pn);
    // 发送请求
    NSString *urlStr = @"http://apis.juhe.cn/cook/index";
    [manager POST:urlStr parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *resultDict = responseObject[@"result"];
        NSArray *dictArray = resultDict[@"data"];
        
        for (NSDictionary *dict in dictArray) {
            [self.foodList addObject:[CPData dataWithDict:dict]];
        }
        // 刷新表格
        [self.tableView reloadData];
        // 关闭菊花
//        [self.tableView footerEndRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark 表格数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:@"MainCell"];
    // 取出当前模型, 赋值
    cell.data = self.foodList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark 表格代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    
    // 取出当前选中的模型
    CPData *foodModel = self.foodList[indexPath.row];    
    dishVC.foodModel = foodModel;
    dishVC.title = foodModel.title;

    [self.navigationController pushViewController:dishVC animated:YES ];
}
@end
