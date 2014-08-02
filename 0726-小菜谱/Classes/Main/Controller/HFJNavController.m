//
//  HFJNavController.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJNavController.h"
#import "UIBarButtonItem+addItem.h"


@interface HFJNavController ()

@end

@implementation HFJNavController

// 在这里设置导航栏的公告属性,这里只会设置一次,viewDidLoad会重复设置
+ (void)initialize
{
    // 设置导航栏
//    [self setupNavThem];
//    // 设置导航栏按钮
//    [self setupButtonThem];

    
    // 拿到主题对象
      UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景颜色和字体颜色
    navBar.backgroundColor = HFJBasicColor;
    
    
}




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1.覆盖返回按钮
    // 只要覆盖了返回按钮, 系统自带的拖拽返回上一级的功能就会失效,在viewdidload里面取消代理即可
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemImage:@"navigationbar_back" highlightedImage:@"navigationbar_back_highlighted" target:self action:@selector(back)];
    
    // 2.添加更多按钮
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemImage:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    
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
 *  设置导航栏按钮
 */
+ (void)setupButtonThem
{
    // 取得全局的nav的item属性 拿到主题对象
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    if (!iOS7) {
        // 设置ios6的背景图片
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    // 设置文字字体,颜色,无阴影
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[UITextAttributeFont] = [UIFont systemFontOfSize:16];
    dict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    dict[UITextAttributeTextColor] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
    // 设置文字高亮状态的字体颜色和去阴影效果
    NSMutableDictionary *dictH = [NSMutableDictionary dictionary];
    dictH[UITextAttributeTextColor] = [UIColor redColor];
    dictH[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    
    [item setTitleTextAttributes:dictH forState:UIControlStateHighlighted];
    
    // 设置不可点击状态下的文字属性
    NSMutableDictionary *mddisabled = [NSMutableDictionary dictionaryWithDictionary:dict];
    mddisabled[UITextAttributeTextColor] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:mddisabled forState:UIControlStateDisabled];
    
}

/**
 *  设置导航栏
 */
+ (void)setupNavThem
{
    // 拿到主题对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景颜色和字体颜色
    if (!iOS7) {
        // 设置背景颜色
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置文字字体,颜色,无阴影
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[UITextAttributeFont] = [UIFont systemFontOfSize:20];
        dict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
        dict[UITextAttributeTextColor] = [UIColor blackColor];
        
        [navBar setTitleTextAttributes:dict];
    }
}





@end
