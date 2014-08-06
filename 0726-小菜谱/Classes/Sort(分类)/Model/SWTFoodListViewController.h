//
//  ZWFoodListViewController.h
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

// 食谱列表
#import <UIKit/UIKit.h>

@interface SWTFoodListViewController : UITableViewController
// 传入的分类ID
@property (nonatomic, strong) NSString *sortID;
@end
