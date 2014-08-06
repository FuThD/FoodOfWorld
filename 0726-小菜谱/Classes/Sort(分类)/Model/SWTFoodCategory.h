//
//  ZWFoodCategory.h
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTFoodCategory : NSObject
// 分类ID
@property (nonatomic, copy) NSString *sortID;
// 分类名称
@property (nonatomic, copy) NSString *name;
/** 工厂方法 */
+ (instancetype)categoryWithDict:(NSDictionary *)dict;
@end
