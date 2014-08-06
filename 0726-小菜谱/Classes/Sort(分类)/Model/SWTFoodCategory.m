//
//  ZWFoodCategory.m
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTFoodCategory.h"

@implementation SWTFoodCategory
+ (instancetype)categoryWithDict:(NSDictionary *)dict
{
    SWTFoodCategory *category = [[self alloc] init];
    category.sortID = dict[@"cid"];
    category.name = dict[@"name"];
    return category;
}
@end
