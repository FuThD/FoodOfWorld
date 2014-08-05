//
//  HFJDishViewController.h
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  菜品控制器, webView展示菜的控制器

#import <UIKit/UIKit.h>
@class CPData, HFJDishViewController;


@interface HFJDishViewController : UIViewController

// 菜品做法模型
@property (nonatomic, strong) CPData *data;

// 菜品做法的字典数据
@property (nonatomic, strong) NSDictionary *dictData;

@end
