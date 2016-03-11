//
//  FTDJNavController.m
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJNavController.h"
#import "UIBarButtonItem+addItem.h"


@interface FTDJNavController ()

@end

@implementation FTDJNavController

// 在这里设置导航栏的公告属性,这里只会设置一次,viewDidLoad会重复设置
+ (void)initialize
{
    // 设置导航栏
    [self setupNavThem];
    
}

// 设置导航栏的左右按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1.覆盖返回按钮
    // 只要覆盖了返回按钮, 系统自带的拖拽返回上一级的功能就会失效,在viewdidload里面取消代理即可
    UIButton *back = [UIBarButtonItem buttonImage:@"back" highlightedImage:@"back_h" target:self action:@selector(back)];
    back.imageView.contentMode = UIViewContentModeCenter;
    back.size = CGSizeMake(12, 20);
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];;
    
    // 2.添加更多按钮
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemImage:@"more" highlightedImage:@"more_h" target:self action:@selector(more)];
    
    // push出控制器
    [super pushViewController:viewController animated:animated];
    
}

// leftBarButtonItem 点击事件
- (void)back
{
    [self popViewControllerAnimated:YES];
}

// rightBarButtonItem 点击事件
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 如果是ios7 就清空代理,这样push出来的控制器,可以通过右拽回到上一级控制器
    if (iOS7) {
        
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}


/**
 *  设置导航栏
 */
+ (void)setupNavThem
{
    // 拿到主题对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景颜色和字体颜色
    [navBar setBackgroundImage:[UIImage resizableImageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置文字字体,颜色,无阴影
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[UITextAttributeFont] = [UIFont systemFontOfSize:20];
    dict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    dict[UITextAttributeTextColor] = [UIColor whiteColor];
    
    [navBar setTitleTextAttributes:dict];
}


@end
