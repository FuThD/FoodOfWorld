//
//  IWHttpTool.h
//  传智微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 itcast. All rights reserved.


//  网络全球工具类

#import <Foundation/Foundation.h>
typedef void (^successBlock)(id json);
typedef void (^failureBlock)(NSError *error);

@interface FTDJHttpTool : NSObject

/**
 *  发送一个GET请求
 *
 *  @param url     请求的url
 *  @param params  请求的参数
 *  @param success 请求成功调用的block
 *  @param failure 请求失败调用的block
 */
+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

/**
 *  发送一个POST请求
 *
 *  @param url     请求的url
 *  @param params  请求的参数
 *  @param success 请求成功调用的block
 *  @param failure 请求失败调用的block
 */
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params  success:(successBlock)success failure:(failureBlock)failure;

@end
