//
//  FTDJSearchResultController.h
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTDJMainTableViewController.h"

@interface FTDJSearchResultController : FTDJMainTableViewController


/**
 *  网络上搜索到的菜品数据数组
 */
@property (nonatomic, strong) NSArray* dataList;

/**
 *  网络加载失败显示的图片
 */
@property (nonatomic, strong) UIImageView *imageView;

@end
