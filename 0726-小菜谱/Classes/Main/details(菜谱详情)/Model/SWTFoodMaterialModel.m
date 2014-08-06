//
//  SWTFoodBurdenModel.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTFoodMaterialModel.h"

@implementation SWTFoodMaterialModel

+ (instancetype)materialModelWithDict:(NSDictionary *)dict
{
    SWTFoodMaterialModel *model = [[self alloc] init];
    model.name = dict[@"name"];
    model.capacity = dict[@"capacity"];
    return model;
}

@end
