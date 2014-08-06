//
//  HFJSearchViewController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchViewController.h"
#import "HFJSearchTableViewController.h"
#import "HFJSearchHeadView.h"
#import "HFJSearchResultController.h"
#import "HFJHistoryCacheTool.h"
#import "HFJSearchParam.h"
#import "HFJSearchResult.h"
#import "HFJSearchData.h"
#import "HFJSearchMenuTool.h"

@interface HFJSearchViewController ()<HFJSearchTableViewControllerDelegate, UITextFieldDelegate>

/**
 *  标题大View,包含返回按钮和搜索框
 */
@property (nonatomic, strong) UIView *titleView;

/**
 *  搜索框
 */
@property (nonatomic, weak) UITextField * searchBar;

/**
 *  取消按钮
 */
@property (nonatomic, weak) UIButton * backButton;

/**
 *  底部灰色的线
 */
@property (nonatomic, strong) UIView *lineView;

/**
 *  表格
 */
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, weak) HFJSearchTableViewController *tableVC;

@end

@implementation HFJSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = HFJBasicColor;
        self.view.height = HFJViewHeight;
        
        // 设置搜索标题的View
        [self setupTitleView];
        
        // 设置搜索的tableView
        [self setupTableView];
        
        // 设置子视图的frame
        [self setupSubviewsFrame];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 隐藏系统的3个按钮,后面自己定义
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.rightBarButtonItem = nil;

}


// 视图加载完毕,搜索框成为第一响应者
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 设置搜索标题的View
- (void)setupTitleView
{
    self.titleView = [[UIView alloc] init];
    
    // 设置搜索框
    [self setupSearchBar];
    
    // 设置返回按钮
    [self setupBackButtom];
    
    // 将自定义的titleView 设置为导航栏的titleView
    self.navigationItem.titleView = self.titleView;

}

- (void)setupSearchBar
{
    UITextField *searchBar = [[UITextField alloc] init];
    self.searchBar = searchBar;
    
    // 设置代理
    searchBar.delegate = self;
    
    // 设置键盘的返回按钮为搜索
    searchBar.returnKeyType = UIReturnKeySearch;
    
    // 如果搜索框内有文字 搜索按钮不可交互
    self.searchBar.enablesReturnKeyAutomatically = YES;
    
    // 设置背景图片
    searchBar.background = [UIImage resizableImageNamed:@"searchbar_textfield_background"];
    
    // 设置文字垂直居中,字体大小
    searchBar.placeholder = @"搜索菜谱";
    searchBar.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    searchBar.font = [UIFont systemFontOfSize:13];
    
    // 设置搜索框的leftView
    UIImage *image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    UIImageView *icon = [[UIImageView alloc] initWithImage:image];
    searchBar.leftView = icon;
    
    // 设置iocn的宽度,和图片显示居中
    icon.width = 30;
    icon.contentMode = UIViewContentModeCenter;
    
    // 设置leftViewMode
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置删除按钮
    searchBar.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.titleView addSubview:searchBar];
    
}

// 设置返回按钮
- (void)setupBackButtom
{
    // 初始化按钮
    UIButton *backBtn = [[UIButton alloc] init];
    self.backButton = backBtn;
    
    // 设置按钮的文字
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    // 添加监听事件
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleView addSubview:backBtn];
    
}

// 取消按钮点击事件
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}



// 设置tableView
- (void)setupTableView
{
    // 创建一个tableView
    HFJSearchTableViewController *tableVC = [[HFJSearchTableViewController alloc] init];
    self.tableView = tableVC.tableView;
    self.tableVC = tableVC;
    [self.view addSubview:tableVC.tableView];
    
    // 设置代理
    tableVC.searchDelegate = self;
    
    // 添加子控制器
    [self addChildViewController:tableVC];
   
}

// 布局子视图的frame
- (void)setupSubviewsFrame
{
    // 设置标题view的frame
    self.titleView.frame = CGRectMake(0, 20, self.view.width, 44);
    
    // 设置搜索框的frame
    self.searchBar.x = 10;
    self.searchBar.y = 5;
    self.searchBar.width = 245;
    self.searchBar.height = 34;
    
    // 设置取消按钮的frame
    self.backButton.x = 265;
    self.backButton.y = 5;
    self.backButton.width = 34;
    self.backButton.height = 34;

    
    // 设置tableView的frame
    CGFloat y = 0;
    if (iOS7) {
        
        y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    }
    
    self.tableView.frame = CGRectMake(0, y, self.view.width, self.view.height - y);
   
}

//  键盘搜索按钮的监听事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 关闭第一响应
    [self.searchBar resignFirstResponder];

    // 搜索菜谱
    [self searchMenu:self.searchBar.text];

    return YES;
}

#pragma mark - HFJSearchControllerDelegate代理方法,取消搜索框的第一响应者
- (void)searchControllerBeginDraggingORDidSelectedCell:(HFJSearchTableViewController *)searchTableViewController searchText:(NSString *)menu
{
    [self.searchBar resignFirstResponder];
    
    // 如果有搜索关键词, 发送请求搜索
    if (menu) {
        
        [self searchMenu:menu];
    }
}


// 搜索菜谱
- (void)searchMenu:(NSString *)menu
{
    
    // 搜索结果的表格控制器
    HFJSearchResultController *searchResultController = [[HFJSearchResultController alloc] init];
    [self.navigationController pushViewController:searchResultController animated:YES];
    searchResultController.title = menu;
    
    
    // 搜索参数模型
    HFJSearchParam *param = [[HFJSearchParam alloc] init];
    param.menu = menu;
    param.key = HFJAppkey;
    param.rn = @20;
    
    // 搜索菜谱工具类, 搜索菜谱
    [HFJSearchMenuTool searchMenuWithParam:param success:^(HFJSearchData *data) {
        
        if (data) {
            
            // 如果有数据, 设置控制器的数据
            searchResultController.dataList = data.data;

            // 存储为历史搜索, 并存到数据库中
            if (![self.tableVC.historyMenuList containsObject:menu]) {
                
                [self.tableVC.historyMenuList addObject:menu];
                [HFJHistoryCacheTool saveHistorySearchKeyWord:menu];
            }
            
        }else{
    
            // 如果searchResultController存在(网络卡的时候,可能会pop回这个界面,又调用下面的方法)
            if (searchResultController) {
                
                // 隐藏蒙版
                [MBProgressHUD hideHUD];
                
                // 如果没有找到菜谱数据, 就提示错误信息
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"没有找到数据" message:@"请重新输入" delegate:searchResultController cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
       
    } failure:^(NSError *error) {
        
        // 如果searchResultController存在(网络卡的时候,可能会pop回这个界面,又调用下面的方法)
        if (searchResultController) {

            // 隐藏蒙版
            [MBProgressHUD hideHUD];
                
            // 如果网络不给力, 就提示错误信息
            //  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络不给力哦!" message:@"稍后再试试" delegate:searchResultController cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                      
            // [alert show];

       }
        
        MyLog(@"%@", error);

    }];
    
    
    
   

}


@end
