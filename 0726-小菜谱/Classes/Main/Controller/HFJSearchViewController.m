//
//  HFJSearchViewController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchViewController.h"
#import "HFJSearchTableViewController.h"

/**
 *  通知名称,发送控制器给主控制器,让主控制器添加为子控制器
 */
NSString *const Controller = @"Controller";

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
 *  返回按钮
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

@end

@implementation HFJSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.alpha = 0;
        self.view.backgroundColor = HFJBasicColor;
        self.view.frame = HFJViewFrame;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            // 透明度
            self.view.alpha = 1;
        }];
        
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

    // 发送一个通知到通知中心,传递控制器给主控制器
    [[NSNotificationCenter defaultCenter] postNotificationName:Controller object:self];
}


- (void)setupTitleView
{
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, 44)];
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
    
    // 设置按钮图标
//    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
//    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
    
    // 设置按钮的文字
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    // 添加监听事件
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleView addSubview:backBtn];
    
}

// 返回按钮点击事件
- (void)back
{
    // 动画,淡出self
    [UIView animateWithDuration:0.5 animations:^{
        
        self.view.alpha = 0;
        
    }completion:^(BOOL finished) {
        
        // 动画完成后移除self.view和控制器本身
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
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
    self.lineView.frame = CGRectMake(5, self.titleView.height - 2, self.view.width - 10, 1);
    
    // 设置tableView的frame
    CGFloat y = CGRectGetMaxY(self.lineView.frame);
    self.tableView.frame = CGRectMake(0, 64, self.view.width, self.view.height - y);
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
#warning 待实现搜索功能,或者根据搜索框的文字,通过通知搜索
    // 关闭第一响应
    [self.searchBar resignFirstResponder];
    return YES;
}


@end
