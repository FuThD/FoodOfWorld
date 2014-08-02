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
        self.view.frame = HFJViewFrame;
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 设置搜索标题的View
- (void)setupTitleView
{
    self.titleView = [[UIView alloc] init];
//    [self.view addSubview:self.titleView];
    
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

#pragma mark - HFJSearchControllerDelegate代理方法,取消搜索框的第一响应者
- (void)searchControllerBeginDraggingORDidSelectedCell:(HFJSearchTableViewController *)searchTableViewController searchText:(NSString *)menu
{
    [self.searchBar resignFirstResponder];
    
    if (menu) {
        [self searchMenu:menu];
    }
}

// 视图加载完毕,搜索框成为第一响应者
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];

}

// 布局子视图的frame
- (void)setupSubviewsFrame
{
    // 设置标题view的frame
    self.titleView.frame = CGRectMake(0, 20, self.view.width, 44);
    
    // 设置搜索框的frame
    self.searchBar.x = 10;
    self.searchBar.y = 5;
    self.searchBar.width = 230;
    self.searchBar.height = 34;
    
    // 设置取消按钮的frame
    self.backButton.x = 260;
    self.backButton.y = 5;
    self.backButton.width = 34;
    self.backButton.height = 34;

    
    // 设置tableView的frame
    CGFloat y = 0;
    if (iOS7) {
        
        y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    }
    
    NSLog(@"%f",y);
    self.tableView.frame = CGRectMake(0, y, self.view.width, self.view.height - y);
   
}

//  键盘搜索按钮的监听事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 关闭第一响应
    [self.searchBar resignFirstResponder];

    // 搜索菜谱
    [self searchMenu:self.searchBar.text];

    // 隐藏表格的headview,即清空历史记录的view
    //    [self.tableVC hiddenHeadView];
    return YES;
}

// 搜索菜谱
- (void)searchMenu:(NSString *)menu
{

    // 加载数据
    NSString *url = @"http://apis.juhe.cn/cook/query?key=&menu=%E8%A5%BF%E7%BA%A2%E6%9F%BF&rn=10&pn=3";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"menu"] = menu;
    params[@"key"] = HFJAppkey;
    params[@"rn"] = @15;
    
    // 发送一个网络请求
    [HFJHttpTool getWithUrl:url params:params success:^(id json) {
    
        if ([json[@"reason"] isEqualToString:@"Success"]) {
            
            // 如果有有搜索到数据,就传递数据到表格中.
            self.tableVC.dataList = json[@"result"][@"data"];
        }else{
        
            // 如果没有找到菜谱数据, 就提示错误信息
            [MBProgressHUD showError:@"没有找到数据,请重新输入"];
            
            // 清空输入框内容
            // self.searchBar.text = @"";
        }
    
    } failure:^(NSError *error) {
       
        MyLog(@"%@", error);
    }];
    
    
    // 如果表格里面有cell
    if ([self.tableVC.tableView numberOfRowsInSection:0]) {
        
        // 表格滚动到最上面一行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableVC.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}


@end
