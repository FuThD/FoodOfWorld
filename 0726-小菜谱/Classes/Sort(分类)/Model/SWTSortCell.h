//
//  ZWSortCell.h
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SWTSortCellIdentifier @"sortCell"
#define SWTSortCellNibName @"SWTSortCell"
@class SWTFoodCategory;
@interface SWTSortCell : UICollectionViewCell
// 分类
@property (nonatomic, strong) SWTFoodCategory *category;

/**工厂方法， 快速返回一个cell*/
+ (instancetype)cellWithCollectView:(UICollectionView *)collectView IndexPath:(NSIndexPath *)indexPath;
@end
