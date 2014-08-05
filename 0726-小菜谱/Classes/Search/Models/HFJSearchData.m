//
//  HFJSearchData.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchData.h"
#import "CPData.h"

@implementation HFJSearchData

- (NSDictionary *)objectClassInArray
{
    return @{@"data" : [CPData class]};
}

@end
