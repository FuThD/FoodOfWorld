//
//  HFJSearchResult.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.


//  搜索结果参数

#import <Foundation/Foundation.h>

@interface HFJSearchResult : NSObject

// 请求结果的状态(成功/受限制)
@property (nonatomic, copy) NSString * reason;


// 请求的结果数据的字典 @{data:菜品数据}
@property (nonatomic, copy) NSDictionary * result;

@end
