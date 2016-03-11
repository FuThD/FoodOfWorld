//
//  FTDJCollectMenuTool
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.


//  收藏/取消收藏菜谱工具类(数据库存储)

#import <Foundation/Foundation.h>
@class SWTData;


@interface FTDJCollectMenuTool : NSObject

/**
 *  存储喜爱的菜谱
 */
+ (BOOL)saveCollectMenus:(SWTData *)foodModel;


/**
*  读取收藏的菜谱
*/
+ (NSArray *)collectMenus;


/**
 *  删除收藏的菜谱
 */
+ (BOOL)deleteMenu:(SWTData *)foodModel;


/**
 *  查询收藏的菜谱
 */
+ (BOOL)searchMenu:(SWTData *)foodModel;



@end
