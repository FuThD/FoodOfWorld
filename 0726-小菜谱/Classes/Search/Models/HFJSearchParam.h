//
//  HFJSearchParam.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.


//  搜索参数模型

#import <Foundation/Foundation.h>

@interface HFJSearchParam : NSObject

/**
 *  搜索关键词
 */
@property (nonatomic, copy) NSString * menu;

/**
 *  appkey
 */
@property (nonatomic, copy) NSString * key;

/**
 *  返回数据条数
 */
@property (nonatomic, copy) NSNumber * rn;

@end
