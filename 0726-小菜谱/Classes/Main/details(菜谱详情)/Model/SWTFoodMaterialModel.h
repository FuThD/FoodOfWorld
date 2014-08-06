//
//  SWTFoodBurdenModel.h
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

// 食物配料 模型

#import <Foundation/Foundation.h>

@interface SWTFoodMaterialModel : NSObject
// 配料名字
@property (nonatomic, copy) NSString *name;
// 配料 量
@property (nonatomic, copy) NSString *capacity;

+ (instancetype)materialModelWithDict:(NSDictionary *)dict;

@end
