//
//  CPStep.h
//  将数据存储到数据库
//
//  Created by 李建平 on 14-8-3.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPStep : NSObject

/** 步骤的图片 */
@property (nonatomic, copy) NSString *img;

/** 步骤说明 */
@property (nonatomic, copy) NSString *step;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)stepWithDict:(NSDictionary *)dict;
@end
