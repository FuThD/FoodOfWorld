//
//  FTDJSearchMenuTool.h
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.

//  搜索菜谱业务工具类

#import <Foundation/Foundation.h>
@class FTDJSearchParam, FTDJSearchResult, FTDJSearchData;

@interface FTDJSearchMenuTool : NSObject

/**
 *  搜索菜谱业务类
 *
 *  @param param   搜索参数
 *  @param success 搜索结果
 *  @param failure 错误信息
 */
+ (void)searchMenuWithParam:(FTDJSearchParam *)param success:(void(^)(FTDJSearchData *data))success failure:(void(^)(NSError *error))failure;

@end
