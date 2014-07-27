//
//  HFJSortCollectionView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSortCollectionViewConrtoller.h"
#import "HFJSortCollectionViewCell.h"
#import "HFJCuisineTableViewController.h"

@implementation HFJSortCollectionViewConrtoller

static NSString *ID = @"sort";

- (instancetype)init
{
    // 所有的CollectionView都需要一个布局参数
    // 实例化流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 10.0f;
    layout.minimumInteritemSpacing = 10.0f;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 设置frame
    self.collectionView.y = 0;
    self.collectionView.height = HFJViewFrame.size.height;
    self.collectionView.width = HFJViewFrame.size.width;
    
    self.collectionView.bounces = NO;

    
    // 为CollectionView注册可重用单元格
    UINib *nib = [UINib nibWithNibName:@"cellectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewController 数据源方法和代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HFJSortCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
#warning 添加了view 看不到.....
    HFJCuisineTableViewController *cuisineVC = [HFJCuisineTableViewController alloc];
    cuisineVC.tableView.frame = HFJViewFrame;
    cuisineVC.tableView.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:cuisineVC];
    [self.view addSubview:cuisineVC.tableView];
    NSLog(@"%@", NSStringFromCGRect(cuisineVC.tableView.frame));
    NSLog(@"%@", NSStringFromClass([cuisineVC.tableView.superview class]));
    // UICollectionViewControllerWrapperView

}

@end
