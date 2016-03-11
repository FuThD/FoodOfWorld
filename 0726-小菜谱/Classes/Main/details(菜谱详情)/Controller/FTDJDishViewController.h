//
//  FTDJDishViewController.h
//  0726-小菜谱
//
//  Created by FTDjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  菜品控制器, webView展示菜的控制器

#import <UIKit/UIKit.h>
@class SWTData;

@interface FTDJDishViewController : UITableViewController

// 菜品做法模型
@property (nonatomic, strong) SWTData *foodModel;

@end
