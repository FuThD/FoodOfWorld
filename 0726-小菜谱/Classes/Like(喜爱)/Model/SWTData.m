//
//  CPData.m
//  将数据存储到数据库
//
//  Created by 李建平 on 14-8-3.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "SWTData.h"
#import "SWTStep.h"

@implementation SWTData

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
//        self.cid = dict[@"id"];
        self.title = dict[@"title"];
        self.ingredients = dict[@"ingredients"];
        self.imtro = dict[@"imtro"];
        self.burden = dict[@"burden"];
//        self.tags = dict[@"tags"];
        self.steps = dict[@"steps"];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in self.steps) {
            SWTStep *album = [[SWTStep alloc] initWithDict:dict];
            
            [arrayM addObject:album];
        }
        self.steps = arrayM;
        
        self.albums = dict[@"albums"];
        
    }
    return self;
}

+ (instancetype)dataWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


// steps数组里面存得CPStep对象
- (NSDictionary *)objectClassInArray
{
    return @{@"steps" : [SWTStep class]};
}




@end
