//
//  HFJDishViewController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJDishViewController.h"
#import "UIBarButtonItem+addItem.h"
#import "CPData.h"
#import "HFJCollectMenuTool.h"

@interface HFJDishViewController ()

@end

@implementation HFJDishViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // 设置颜色
        self.view.backgroundColor = HFJBasicColor;
        
        // 设置导航条
        [self setupNavBar];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

// 设置导航条
- (void)setupNavBar
{
    // 设置导航栏的titleView
    UIView *navBar = [[UIView alloc] init];
    navBar.size = CGSizeMake(220, 44);
    self.navigationItem.titleView = navBar;
    
#warning 收藏按钮,等待更换图片
    UIButton *collect = [UIBarButtonItem buttonImage:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" target:self action:@selector(collect)];
    collect.center = CGPointMake(190, 22);
    [navBar addSubview:collect];
    
}

// 收藏/取消收藏按钮 点击事件
- (void)collect
{
    // 从数据库获取最新的数据
    NSArray *collectMenus = [HFJCollectMenuTool collectMenus];
    
    // 如果数据库中,有本条菜谱数据
    if ([collectMenus containsObject:self.dictData]) {
        
        // 从数据库里面搜索到菜谱, 删除收藏的菜谱
        [HFJCollectMenuTool deleteMenu:self.dictData];
    }else{
    
        // 如果没有搜索到菜谱收藏喜爱的菜谱
        [HFJCollectMenuTool saveCollectMenus:self.dictData];
    }
}






@end
