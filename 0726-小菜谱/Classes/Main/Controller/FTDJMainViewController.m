//
//  FTDJViewController.m
//  0721- 小菜谱
//
//  Created by FTDjflydove on 14-7-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJMainViewController.h"
#import "CPBestTableViewController.h"
#import "FTDJLikeTableViewController.h"
#import "FTDJMenuButtonView.h"
#import "FTDJSearchViewController.h"
#import "SWTSortViewController.h"
#import "UIBarButtonItem+addItem.h"



@interface FTDJMainViewController ()<FTDJTitleButtonViewDelegate, UIScrollViewDelegate, UIAlertViewDelegate>

/**
 *  主视图的底部ScrollView
 */
@property (nonatomic, strong) UIScrollView *myScrollView;

/**
 *  菜单按钮的view
 */
@property (nonatomic, weak) FTDJMenuButtonView *menuBtnView;

@end

@implementation FTDJMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 设置最上面的标题view
    [self setupNavBar];
    
    // 3个控制器的菜单按钮
    [self setupTitleButtonView];
    
    // 设置ScrollView
    [self setupScrollView];
    
    // 设置tableView
    [self setupTableViews];
}

// 设置最上面的标题view
- (void)setupNavBar
{
    // logo图标
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo 130-53"]];
    logo.frame = CGRectMake(0, 0, 65, 28);
    self.navigationItem.titleView = logo;
   
    // 搜索按钮
    UIButton *searchBtn = [UIBarButtonItem buttonImage:@"search" highlightedImage:@"search-h" target:self action:@selector(searchBtnClick)];
    searchBtn.size = CGSizeMake(20, 20);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    // 左边清理图片缓存按钮
    UIButton *clearBtn = [UIBarButtonItem buttonImage:@"clear" highlightedImage:@"clear-h" target:self action:@selector(clearBtnClick)];
    clearBtn.size = CGSizeMake(20, 20);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:clearBtn];
}


// 添加搜索按钮的监听事件
- (void)searchBtnClick
{
    // 实例化一个搜索view的控制器
    FTDJSearchViewController *searchViewController = [[FTDJSearchViewController alloc] init];
    
    // push出新界面
    [self.navigationController pushViewController:searchViewController animated:YES];
}

// 左边清理图片缓存按钮
- (void)clearBtnClick
{
    // 提示框提示, 是否清理缓存
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"清理图片缓存" message:@"是否要清理所有图片缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 如果按的取消按钮就直接返回
    if (buttonIndex == 0) return;
    
    // 如果按的确定按钮
    // 获取缓存文件夹
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *cachesPath = [path stringByAppendingPathComponent:@"com.hackemist.SDWebImageCache.default"];

    // 2.1获取文件管理者对象
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL success = [manager removeItemAtPath:cachesPath error:nil];
    
    if (success) {
        
        [MBProgressHUD showSuccess:@"清除图片缓存成功"];
 
    }else{
        
        [MBProgressHUD showError:@"清除失败, 或者没有缓存了哦!"];
    }
}


// 3个控制器的菜单按钮
- (void)setupTitleButtonView
{
    // 初始化视图
    FTDJMenuButtonView *titleBtnView = [[FTDJMenuButtonView alloc] init];
    self.menuBtnView = titleBtnView;
    
    // 设置代理
    self.menuBtnView.delegate = self;
    // 设置frame
    self.menuBtnView.x = 0;
    self.menuBtnView.width = self.view.width;
    self.menuBtnView.height = 35;
    if (iOS7) {
        
        self.menuBtnView.y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    }else{
        
        self.menuBtnView.y = 0;
    }
    
    // 添加到父视图中
    [self.view addSubview:titleBtnView];

}

// 设置主视图的底部ScrollView
- (void)setupScrollView
{
    self.myScrollView.contentSize = CGSizeMake(3 * self.view.width, 0);
    
    // 设置scrollView的属性
    self.myScrollView.bounces = NO;
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.showsVerticalScrollIndicator = NO;
    self.myScrollView.userInteractionEnabled = YES;
    
    // 垂直滚动时,左右不能滚动
    self.myScrollView.directionalLockEnabled = YES;

    // 设置代理
    self.myScrollView.delegate = self;

}


// 初始化3个控制器,添加为子控制器,把控制器的view添加到根视图的scrollView里面,设置frame的x值
- (void)setupTableViews
{
    // 精选控制器
    CPBestTableViewController *goodTabVC = [[CPBestTableViewController alloc] init];
    [self.myScrollView addSubview:goodTabVC.tableView];
    goodTabVC.tableView.x = 0;
    [self addChildViewController:goodTabVC];

    // 分类控制器
    SWTSortViewController *sortTabVC = [[SWTSortViewController alloc] init];
    sortTabVC.collectionView.x = CGRectGetMaxX(goodTabVC.tableView.frame);
    [self.myScrollView addSubview:sortTabVC.collectionView];
    [self addChildViewController:sortTabVC];
    
    // 喜爱控制器
    FTDJLikeTableViewController *likeTabVC = [[FTDJLikeTableViewController alloc] init];
    likeTabVC.tableView.x = CGRectGetMaxX(sortTabVC.collectionView.frame);
    [self.myScrollView addSubview:likeTabVC.tableView];
    [self addChildViewController:likeTabVC];

}



#pragma mark - FTDJTitleButtonViewDelegate 代理方法

// 点击按钮切换tableView
- (void)titleButtonViewDidClickButton:(NSInteger)tag
{
    [UIView animateWithDuration:FTDJViewMovedTime animations:^{
        
        self.myScrollView.contentOffset = CGPointMake(tag * self.view.width, 0);
    }];
}


#pragma mark - UIScrollViewDelegate 代理方法
// 拖动scrollView,切换标题按钮的选中状态
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取得scrollView的contentOffset.x
    int x = scrollView.contentOffset.x;
    
    // 计算当应该被选中按钮在标题按钮数组中的角标
    NSInteger i = x / (self.view.width) + 0.5 ;
    self.menuBtnView.i = i;

    // 获取移动的比例,传递给子视图,子视图设置绿色的线的位置
    CGFloat progress = x / (2 * self.view.width);
    self.menuBtnView.progress = progress;
}


#pragma mark - 懒加载
- (UIScrollView *)myScrollView
{
    if (_myScrollView == nil) {
        
        // 设置frame
        CGFloat y = CGRectGetMaxY(self.menuBtnView.frame);
        CGFloat h = self.view.height - y;
        CGFloat w = self.view.width;
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, w, h)];
        
        [self.view addSubview:self.myScrollView];
    }
    return _myScrollView;
}



@end
