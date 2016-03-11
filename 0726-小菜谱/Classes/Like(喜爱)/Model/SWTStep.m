//
//  CPStep.m
//  将数据存储到数据库
//
//  Created by 李建平 on 14-8-3.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "SWTStep.h"

@implementation SWTStep

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.img = dict[@"img"];
        self.step = dict[@"step"];
    }
    return self;
}

+ (instancetype)stepWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}



- (NSString *)step
{
    return [NSString stringWithFormat:@"    %@", _step];
}


@end
