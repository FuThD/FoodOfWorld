//
//  CPData.m
//  将数据存储到数据库
//
//  Created by 李建平 on 14-8-3.
//  Copyright (c) 2014年 jony. All rights reserved.
//

#import "CPData.h"

@implementation CPData

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.cid = dict[@"id"];
        self.title = dict[@"title"];
        self.ingredients = dict[@"ingredients"];
        self.imtro = dict[@"imtro"];
        self.burden = dict[@"burden"];
        self.tags = dict[@"tags"];
        self.steps = dict[@"steps"];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in self.steps) {
            CPStep *album = [[CPStep alloc] initWithDict:dict];
            
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


/**
 *  解档
 */
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        
//        _cid = [aDecoder decodeObjectForKey:@"cid"];
//        _title = [aDecoder decodeObjectForKey:@"title"];
//        _albums = [aDecoder decodeObjectForKey:@"albums"];
//        _ingredients = [aDecoder decodeObjectForKey:@"ingredients"];
//        _burden = [aDecoder decodeObjectForKey:@"burden"];
//        _tags = [aDecoder decodeObjectForKey:@"tags"];
//        _imtro = [aDecoder decodeObjectForKey:@"imtro"];
//        _steps = [aDecoder decodeObjectForKey:@"steps"];
//
//    }
//
//    return self;
//}
//
///**
// *  归档
// */
//
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:_cid forKey:@"cid"];
//    [aCoder encodeObject:_title forKey:@"title"];
//    [aCoder encodeObject:_albums forKey:@"albums"];
//    [aCoder encodeObject:_ingredients forKey:@"ingredients"];
//    [aCoder encodeObject:_burden forKey:@"burden"];
//    [aCoder encodeObject:_tags forKey:@"tags"];
//    [aCoder encodeObject:_imtro forKey:@"imtro"];
//    [aCoder encodeObject:_steps forKey:@"steps"];
//
//}


@end
