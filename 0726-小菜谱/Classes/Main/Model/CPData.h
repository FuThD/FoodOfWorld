//
//  CPData.h
//  将数据存储到数据库
//
//  Created by 李建平 on 14-8-3.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPStep.h"

@interface CPData : NSObject<NSCoding>

/** 索引 */
@property (nonatomic, copy) NSString *cid;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 大图 */
@property (nonatomic, copy) NSArray *albums;

/** 所需需要食材 */
@property (nonatomic, copy) NSString *ingredients;

/** 所需的配料 */
@property (nonatomic, copy) NSString *burden;

/** 搜索的关键字 */
@property (nonatomic, copy) NSString *tags;

/** 事务简介 */
@property (nonatomic, copy) NSString *imtro;

/** 制作步骤 */
@property (nonatomic, strong) NSArray *steps;

//@property (nonatomic, strong) NSDictionary *dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)dataWithDict:(NSDictionary *)dict;

@end
