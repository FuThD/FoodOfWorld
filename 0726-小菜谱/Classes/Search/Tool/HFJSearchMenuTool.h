//
//  HFJSearchMenuTool.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.

//  搜索菜谱业务工具类

#import <Foundation/Foundation.h>
@class HFJSearchParam, HFJSearchResult, HFJSearchData;

@interface HFJSearchMenuTool : NSObject

/**
 *  搜索菜谱业务类
 *
 *  @param param   搜索参数
 *  @param success 搜索结果
 *  @param failure 错误信息
 */
+ (void)searchMenuWithParam:(HFJSearchParam *)param success:(void(^)(HFJSearchData *data))success failure:(void(^)(NSError *error))failure;

@end
