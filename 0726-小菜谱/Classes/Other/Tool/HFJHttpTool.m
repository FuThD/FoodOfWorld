//
//  IWHttpTool.m
//  传智微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  网络请求工具类

#import "HFJHttpTool.h"
#import "AFNetworking.h"

@implementation HFJHttpTool

+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
   
     // 发送一个post请求
     // 1.获取AFN的请求管理者
     AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
     
    // 3.发送请求
    [manger GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    // 发送一个post请求
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];

    // 3.发送请求
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        IWLog(@"发送成功");
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        IWLog(@"请求失败 %@", error);
        if (failure) {
            failure(error);
        }
    }];
}

@end
