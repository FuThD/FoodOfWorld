//
//  HFJDishViewController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJDishViewController.h"

@interface HFJDishViewController ()

@end

@implementation HFJDishViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = HFJBasicColor;
        self.view.frame = HFJViewFrame;
        
//        self.view.alpha = 0;
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            // 透明度
//            self.view.alpha = 1;
//        }];
//        
        // 设置返回按钮
        [self setupBackButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setupBackButton
{
    // 初始化按钮
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 25, 34, 34)];

    
    // 设置按钮图标
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];

    // 添加监听事件
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
//    [self.view addSubview:backBtn];
    
}

// 返回按钮点击事件
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];

}
@end
