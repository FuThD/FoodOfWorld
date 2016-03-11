//
//  Common.h
//  01-小菜谱
//
//  Created by FTD on 14-6-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

//------------------------------------------------------------------------------
// 1>   自定义Log宏，在编译模式运行时，取消所有的日志输出
#ifdef DEBUG
#define MyLog(...)          NSLog(__VA_ARGS__)
#else
#define MyLog(...) 
#endif

// 2>   Log调用的函数
#define LogFunc             MyLog(@"%s", __func__);
// 3>   Log指定视图的边界
#define LogFrame(view)      MyLog(@"%@", NSStringFromCGRect(view.frame));
// 4>   Log指定视图中的所有子视图
#define LogSubViews(view)   MyLog(@"%@", view.subviews);

// 判断系统的版本
#define iOS7                ([UIDevice currentDevice].systemVersion.floatValue >= 7.0)

// 屏幕分辨率
#define screenScale         ([UIScreen mainScreen].scale)

// 是否4寸屏
#define is4Inch             ([UIScreen mainScreen].bounds.size.height == 568.0)

// 角度转弧度
#define degree2angle(angle)     (((angle) * M_PI) / 180)


// 随机颜色
#define FTDJRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:arc4random_uniform(255)/255.0]

// 执行SEL 处理SEL风险警告问题
#define performSelector(method)    if ([self respondsToSelector:method]) { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
[self performSelector:method]; \
_Pragma("clang diagnostic pop") \
}
















