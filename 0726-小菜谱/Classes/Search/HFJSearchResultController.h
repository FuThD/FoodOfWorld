//
//  HFJSearchResultController.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFJMainTableViewController.h"

@interface HFJSearchResultController : HFJMainTableViewController


/**
 *  网络上搜索到的菜品数据数组
 */
@property (nonatomic, strong) NSArray* dataList;

/**
 *  对应菜品数据的字典数组
 */
@property (nonatomic, strong) NSArray *dataArray;


@end
