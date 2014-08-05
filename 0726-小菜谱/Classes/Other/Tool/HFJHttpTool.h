//
//  IWHttpTool.h
//  传智微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(id json);
typedef void (^failureBlock)(NSError *error);

@interface HFJHttpTool : NSObject

+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params  success:(successBlock)success failure:(failureBlock)failure;

@end
