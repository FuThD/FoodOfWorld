//
//  HFJCollectMenuTool.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJCollectMenuTool.h"
#import "FMDB.h"
//#import "CPData.h"

@implementation HFJCollectMenuTool


static FMDatabase *_db;

// 创建数据库表,只创建一次
+ (void)initialize
{
    // 沙盒路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"t_collectMenu.sqlite"];
    
    // 创建数据库
    _db = [FMDatabase databaseWithPath:filePath];
    
    if ([_db open]) {
        
        // 创建表
        BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_collectMenu(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, collectMenu BLOB NOT NULL, cid TEXT NOT NULL);"];
        if (success) {
            MyLog(@"创建t_collectMenu表成功");
        }else{
            MyLog(@"创建t_collectMenu表失败");
        }
    }
}



/**
 *  读取收藏的菜谱
 */
+ (NSArray *)collectMenus
{
    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_collectMenu "];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 循环取出数据存到数组中
    while ([set next]) {
        
        // 取出数据
        NSData *data = [set objectForColumnName:@"collectMenu"];
        
        // 反序列化
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        MyLog(@"读取收藏的菜谱");
        // 存到数组中
        [arrayM addObject:dict];
    }
    
    return arrayM;
}

/**
 *  存储喜爱的菜谱
 */
+ (BOOL)saveCollectMenus:(NSDictionary *)dict
{

    // 将json数据序列化
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];

    // 存储数据
    BOOL success = [_db executeUpdate:@"INSERT INTO t_collectMenu(collectMenu, cid) VALUES(?, ?)",data, dict[@"id"]];
    
    if (success) {
        
        MyLog(@"保存成功");
        return YES;
        
    }else{
        
        MyLog(@"保存失败");
        
        return NO;
    }
}

/**
 *  删除收藏的菜谱
 */
+ (BOOL)deleteMenu:(NSDictionary *)dict
{

    // 将json数据序列化
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    // 删除数据
    BOOL success = [_db executeUpdate:@"DELETE FROM t_collectMenu WHERE cid = ?",dict[@"id"]];

    if (success) {
        
        MyLog(@"删除成功");
        return YES;
        
    }else{
        
        MyLog(@"删除失败");
        return NO;
    }
}

/**
 *  查询收藏的菜谱
 */
//+ (BOOL)searchMenu:(NSDictionary *)dict
//{
//    // 将json数据序列化
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//    
//    // 存储数据
//    FMResultSet *set = [_db executeQuery:@"SELECT collectMenu FROM t_collectMenu WHERE collectMenu = ?", data];
//    
//    NSDictionary *searchDict = nil;
//    while ([set next]) {
//        
//        NSData *searchData = [set objectForColumnName:@"collectMenu"];
//        
//        // 将搜索到得结果反序列化
//        searchDict = [NSJSONSerialization JSONObjectWithData:searchData options:NSJSONReadingMutableContainers error:nil];
//        
//        MyLog(@"dict%@, searchDict%@", dict[@"id"], searchDict[@"id"] );
//        
//        if ([dict[@"id"] isEqualToString:searchDict[@"id"]]) {
//            
//            MyLog(@"找到菜谱了");
//            return YES;
//        }else{
//            
//            MyLog(@"没找到菜谱");
//            return NO;
//        }
//    }
//    
//    MyLog(@"到底找没找到菜谱");
//    return NO;
//}









@end
