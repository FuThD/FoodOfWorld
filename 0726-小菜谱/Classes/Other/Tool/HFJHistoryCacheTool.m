//
//  HFJHistoryCacheTool.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJHistoryCacheTool.h"
#import "FMDB.h"

@implementation HFJHistoryCacheTool

static FMDatabase *_db;

// 创建数据库表,只创建一次
+ (void)initialize
{
    // 沙盒路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"t_historySearch.sqlite"];
    
    // 创建数据库
    _db = [FMDatabase databaseWithPath:filePath];
    
    if ([_db open]) {
        
        // 创建表
        BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_historySearch(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, searchKeyWord TEXT NOT NULL);"];
        if (success) {
            MyLog(@"创建表成功");
        }else{
            MyLog(@"创建表失败");
        }
    }
}

/** 存储搜索记录信息 */
+ (BOOL)saveHistorySearchKeyWord:(NSString *)searchKeyWord
{
    // 存储数据
    BOOL success = [_db executeUpdate:@"INSERT INTO t_historySearch(searchKeyWord) VALUES(?)",searchKeyWord];
    
    if (success) {
        
        MyLog(@"保存成功");
        return YES;
        
    }else{
        MyLog(@"保存失败");
        
        return NO;
    }
}

/** 读取搜索记录信息 */
+ (NSMutableArray *)searchKeyWord
{

    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_historySearch "];

    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 循环取出数据存到数组中
    while ([set next]) {
        
        // 取出数据
        NSString *searchKeyWord = [set stringForColumn:@"searchKeyWord"];
        
        // 存到数组中
        [arrayM addObject:searchKeyWord];
    }
    
    return arrayM;

}

/** 清空搜索记录 */
+ (BOOL)clearHistorySearchKeyWord
{
    BOOL success = [_db executeUpdate:@"DELETE FROM t_historySearch"];
    
    if (success) {
        
        MyLog(@"删除成功");
        return YES;
        
    }else
    {
        MyLog(@"删除失败");
        
        return NO;
    }
}












@end
