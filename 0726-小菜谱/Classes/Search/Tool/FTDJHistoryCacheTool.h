//
//  FTDJHistoryCacheTool.h
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-3.
//  Copyright (c) 2014年 itcast. All rights reserved.


// 历史搜索

#import <Foundation/Foundation.h>

@interface FTDJHistoryCacheTool : NSObject

/** 存储搜索记录信息 */
+ (BOOL)saveHistorySearchKeyWord:(NSString *)searchKeyWord;

/** 读取搜索记录信息 */
+ (NSMutableArray *)searchKeyWord;

/** 清空搜索记录 */
+ (BOOL)clearHistorySearchKeyWord;

@end
