//
//  FTDJCollectMenuTool.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJCollectMenuTool.h"
#import "FMDB.h"
#import "SWTData.h"
#import "SWTStep.h"


@implementation FTDJCollectMenuTool

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
        
        // 创建表, 存储CPData 菜谱模型的属性
        BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_collectMenu(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, albums TEXT NOT NULL, ingredients TEXT NOT NULL, burden TEXT NOT NULL, imtro TEXT NOT NULL, steps BLOB NOT NULL);"];
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
         NSString *title = [set objectForColumnName:@"title"];
         NSString *albums = [set objectForColumnName:@"albums"];
         NSString *ingredients = [set objectForColumnName:@"ingredients"];
         NSString *burden = [set objectForColumnName:@"burden"];
         NSString *imtro = [set objectForColumnName:@"imtro"];
         NSData *steps = [set objectForColumnName:@"steps"];

        // 反序列化  取出字典数组
        NSArray *stepsArray = [NSJSONSerialization JSONObjectWithData:steps options:NSJSONReadingMutableContainers error:nil];

        SWTData *foodModel = [[SWTData alloc] init];
        foodModel.title = title;
        foodModel.albums = @[albums];
        foodModel.ingredients = ingredients;
        foodModel.burden = burden;
        foodModel.imtro = imtro;
        
        // 字典数组转成模型数组
        foodModel.steps  = [SWTStep objectArrayWithKeyValuesArray:stepsArray];

        // 存到数组中
        [arrayM addObject:foodModel];
    }
    
//    MyLog(@"%@",foodModel.albums);
    return arrayM;
}

/**
 *  存储喜爱的菜谱
 */
+ (BOOL)saveCollectMenus:(SWTData *)foodModel
{
    // 将json数据序列化
    NSData *data = [NSJSONSerialization dataWithJSONObject:foodModel.keyValues[@"steps"] options:NSJSONWritingPrettyPrinted error:nil];

    // 存储数据
    BOOL success = [_db executeUpdate:@"INSERT INTO t_collectMenu(title , albums, ingredients, burden, imtro, steps ) VALUES(?, ?, ?, ?, ?, ?)",foodModel.title, foodModel.albums[0], foodModel.ingredients, foodModel.burden, foodModel.imtro, data];
    
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
+ (BOOL)deleteMenu:(SWTData *)foodModel
{

    // 删除数据, 根据菜谱的头像图片地址
    BOOL success = [_db executeUpdate:@"DELETE FROM t_collectMenu WHERE albums = ?",foodModel.albums[0]];

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
+ (BOOL)searchMenu:(SWTData *)foodModel
{
    // 存储数据
    FMResultSet *set = [_db executeQuery:@"SELECT albums FROM t_collectMenu WHERE albums = ?",foodModel.albums[0]];
    
    NSString *search = nil;
    
    while ([set next]) {
        
        search = [set stringForColumn:@"albums"];
    }
    
    // 比较字符串
    if ([foodModel.albums[0] isEqualToString:search]) {
        
        return YES;
    }else{
        
        return NO;
    }
}









@end
