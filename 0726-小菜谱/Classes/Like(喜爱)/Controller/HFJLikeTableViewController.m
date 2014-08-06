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
#import "HFJCollectMenuTool.h"
#import "CPData.h"

@interface HFJLikeTableViewController()

/**
 *  提示用户收菜菜谱的图片
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 *  存放模型的数组
 */
@property (nonatomic, strong) NSArray *dataList;

/**
 *  存放字典的数组
 */
@property (nonatomic, strong) NSArray *dataArray;

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

    // 如果没有数据, 就显示一个推荐图片,否者不显示
    if (!self.dataArray.count) {
        
        [self.tableView addSubview:self.imageView];
        
    }else{
        
        [self.imageView removeFromSuperview];
        
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *ID = @"Like";
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    CPData *data = self.dataList[indexPath.row];
    cell.data = data;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 将控制器添加到父控制器
    HFJDishViewController *dishVC = [[HFJDishViewController alloc] init];
    
    // 取出数据赋值给dishVC
    CPData *data = self.dataList[indexPath.row];
    dishVC.foodModel = data;
    NSDictionary *dictData = self.dataArray[indexPath.row];
    dishVC.dictData = dictData;

    [self.navigationController pushViewController:dishVC animated:YES];
    
    
//    // 将json数据序列化
//    NSData *data1 = [NSJSONSerialization dataWithJSONObject:dictData options:NSJSONWritingPrettyPrinted error:nil];
//
//    MyLog(@"didSelectRowAtIndexPath/n%@", data1);
}

/**
 *  界面即将要展示, 就获取数据库数据
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 读取数据库
    _dataArray = [HFJCollectMenuTool collectMenus];
    
    _dataList = [CPData objectArrayWithKeyValuesArray:_dataArray];

    
    // 刷新表格
    [self.tableView reloadData];

    // 如果没有数据, 就显示一个推荐图片,否者不显示
    if (!self.dataArray.count) {
        
        [self.tableView addSubview:self.imageView];
        
    }else{
        
        [self.imageView removeFromSuperview];        
    }
}


#pragma mark - 懒加载
- (NSArray *)dataList
{
    if (_dataList == nil) {
        
        _dataList = [NSArray array];
    }
    return _dataList;
}

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        
#warning 提示客户去收藏的图片
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ20140804-1"]];
        
        _imageView.center = self.tableView.center;
        _imageView.backgroundColor = [UIColor redColor];
        
    }
    return _imageView;
}


@end
