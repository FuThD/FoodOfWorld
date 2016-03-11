//
//  FTDJAppDelegate.m
//  0726-小菜谱
//
//  Created by FTDjflydove on 14-7-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJAppDelegate.h"

@implementation FTDJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 设置导航栏为亮灰色
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // 不隐藏状态了
    application.statusBarHidden = NO;
    
    return YES;
}

/**
 *  内存警告
 */
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    
    // 应该在该方法中释放掉不需要的内存
    // 1.停止所有的子线程下载
    [[SDWebImageManager sharedManager] cancelAll];
    
    // 2.清空SDWebImage保存的所有内存缓存
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}
@end
