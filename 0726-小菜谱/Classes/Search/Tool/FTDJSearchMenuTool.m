//
//  FTDJSearchMenuTool.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-8-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJSearchMenuTool.h"
#import "FTDJSearchResult.h"
#import "FTDJSearchParam.h"
#import "FTDJSearchData.h"

@implementation FTDJSearchMenuTool

+ (void)searchMenuWithParam:(FTDJSearchParam *)param success:(void(^)(FTDJSearchData *data))success failure:(void(^)(NSError *error))failure
{

    // 加载数据
    NSString *url = @"http://apis.juhe.cn/cook/query?key=&menu=%E8%A5%BF%E7%BA%A2%E6%9F%BF&rn=10&pn=3";

    // 发送一个网络请求
    [FTDJHttpTool getWithUrl:url params:param.keyValues success:^(id json) {
        
        if (success) {
            
            // 搜索结果模型
            FTDJSearchResult *searchRestul = [FTDJSearchResult objectWithKeyValues:json];
        
            if ([searchRestul.reason isEqualToString:@"Success"]) {
                
                // 如果有有搜索到数据,就传递数据到表格中.
                FTDJSearchData *data = [FTDJSearchData objectWithKeyValues:searchRestul.result];
                
                // 返回搜索结果的data模型
                success(data);
                
            }else if([searchRestul.reason isEqualToString:@"request ip exceeds the limit"]){
                
                // 如果访问受限制, 就提示错误信息
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"服务器出问题了" message:@"请稍后重试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                
            }else{
                
                // 如果没有找到菜谱数据,
                success(nil);
            }
     }
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];

}


@end
