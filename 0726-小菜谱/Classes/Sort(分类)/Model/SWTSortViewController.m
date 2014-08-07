//
//  ZWViewController.m
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTSortViewController.h"
#import "SWTFoodCategory.h"
#import "SWTSortCell.h"
#import "SWTFoodListViewController.h"

@interface SWTSortViewController ()
// 数据
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation SWTSortViewController
#pragma mark 懒加载
- (NSArray *)dataList
{
    if(!_dataList)
    {
        // 字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"plist.bundle/category.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        // 字典转模型
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            [arrayM addObject:[SWTFoodCategory categoryWithDict:dict]];
        }
        _dataList = [arrayM copy];
    }
    return _dataList;
}


- (id)init
{
    // 布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // Item大小
    layout.itemSize = CGSizeMake(80, 80);
    // 边距
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    return  [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 背景颜色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.title = @"所有类别";
    self.collectionView.height = HFJViewHeight;
    
    
    
    // 注册Cell xib
    UINib *nib = [UINib nibWithNibName:SWTSortCellNibName bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:SWTSortCellIdentifier];
}

#pragma mark collectionView 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SWTSortCell *cell = [SWTSortCell cellWithCollectView:collectionView IndexPath:indexPath];
    // 取出当前模型赋值
    cell.category = self.dataList[indexPath.item];
    return cell;
}

#pragma mark collectionView 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出当前模型
    SWTFoodCategory *category = self.dataList[indexPath.item];
    // 实例化列表控制器
    SWTFoodListViewController *listVC = [[SWTFoodListViewController alloc] init];
    listVC.title = category.name;
    // 传递分类ID
    listVC.sortID = category.sortID;
    // 跳转
    [self.navigationController pushViewController:listVC animated:YES];
}

@end
