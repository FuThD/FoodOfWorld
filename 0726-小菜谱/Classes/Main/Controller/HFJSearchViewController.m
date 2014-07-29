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
        
        // 设置底部灰色的线
        [self setButtomLine];
        
        // 设置搜索的tableView
        [self setupTableView];
        
        // 设置子视图的frame
        [self setupSubviewsFrame];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 设置搜索标题的View
- (void)setupTitleView
{
    self.titleView = [[UIView alloc] init];
    [self.view addSubview:self.titleView];
    
    // 设置返回按钮
    [self setupBackButtom];
    
    // 设置搜索框
    [self setupSearchBar];
}

// 设置返回按钮
- (void)setupBackButtom
{
    // 初始化按钮
    UIButton *backBtn = [[UIButton alloc] init];
    self.backButton = backBtn;
    
    // 设置按钮的文字
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupSearchBar
{
    UITextField *searchBar = [[UITextField alloc] init];
    self.searchBar = searchBar;
    
    // 设置代理
    searchBar.delegate = self;
    
    // 设置键盘的返回按钮为搜索
    searchBar.returnKeyType = UIReturnKeySearch;
    
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

// 设置底部灰色的先
- (void)setButtomLine
{
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self.titleView addSubview:self.lineView];
    
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
- (void)searchControllerBeginDraggingORDidSelectedCell:(HFJSearchTableViewController *)searchTableViewController
{
    [self.searchBar resignFirstResponder];
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
    self.searchBar.x = 20;
    self.searchBar.y = 5;
    self.searchBar.width = 240;
    self.searchBar.height = 34;
    
    // 设置取消按钮的frame
    self.backButton.x = 275;
    self.backButton.y = 5;
    self.backButton.width = 34;
    self.backButton.height = 34;
    
    // 设置底部灰色的先的frame
    self.lineView.frame = CGRectMake(0, self.titleView.height - 2, self.view.width, 1);
    
    // 设置tableView的frame
    CGFloat y = CGRectGetMaxY(self.lineView.frame);
    self.tableView.frame = CGRectMake(0, 64, self.view.width, self.view.height - y);
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
#warning 待实现搜索功能,或者根据搜索框的文字,通过通知搜索,先搜索历史记录,再搜索网上的记录
    // 关闭第一响应
    [self.searchBar resignFirstResponder];
    
    // 隐藏表格的headview,即清空历史记录的view
    [self.tableVC hiddenHeadView];

    

    return YES;
}


@end
