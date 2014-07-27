//
//  HFJViewController.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJMainViewController.h"
#import "HFJGoodTableViewController.h"
#import "HFJSortCollectionViewConrtoller.h"
#import "HFJLikeTableViewController.h"
#import "HFJMenuButtonView.h"
#import "HFJTitleView.h"


// Controller 在HFJSearchViewController里面已经定义过
extern NSString * const Controller;


@interface HFJMainViewController ()<HFJTitleButtonViewDelegate, UIScrollViewDelegate>

/**
 *  主视图的底部ScrollView
 */
@property (nonatomic, strong) UIScrollView *myScrollView;

/**
 *  菜单按钮的view
 */
@property (nonatomic, weak) HFJMenuButtonView *menuBtnView;

/**
 *  标题的view
 */
@property (nonatomic, strong) HFJTitleView *titleView;

@end

@implementation HFJMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = HFJBasicColor;
    
    // 设置最上面的标题view
    [self setupTitleView];
    
    // 3个控制器的菜单按钮
    [self setupTitleButtonView];
    
    // 设置ScrollView
    [self setupScrollView];
    
    // 设置tableView
    [self setupTableViews];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNote:) name:Controller object:nil];
}

- (void)receiveNote:(NSNotification *)note
{
    // 把搜索视图的tableView添加为子控制器
    UITableViewController *tableVC = [note object];
    
    [self addChildViewController:tableVC];

}

// 取消通知的监听
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 设置最上面的标题view
- (void)setupTitleView
{
    // 标题的view 存放一个app名字图标的按钮 和一个 搜索按钮
    self.titleView = [[HFJTitleView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    [self.view addSubview:self.titleView];
   
}

// 3个控制器的菜单按钮
- (void)setupTitleButtonView
{
    // 初始化视图
    HFJMenuButtonView *titleBtnView = [[HFJMenuButtonView alloc] init];
    self.menuBtnView = titleBtnView;
    
    // 设置代理
    self.menuBtnView.delegate = self;
    // 设置frame
    self.menuBtnView.x = 0;
    self.menuBtnView.y = CGRectGetMaxY(self.titleView.frame);
    self.menuBtnView.width = self.view.width;
    self.menuBtnView.height = 35;
    
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
    HFJGoodTableViewController *goodTabVC = [[HFJGoodTableViewController alloc] init];
    [self.myScrollView addSubview:goodTabVC.tableView];
    goodTabVC.tableView.x = 0;
    [self addChildViewController:goodTabVC];

    // 分类控制器
    HFJSortCollectionViewConrtoller *sortTabVC = [[HFJSortCollectionViewConrtoller alloc] init];
    sortTabVC.collectionView.x = CGRectGetMaxX(goodTabVC.tableView.frame);
    [self.myScrollView addSubview:sortTabVC.collectionView];
    [self addChildViewController:sortTabVC];
    
    // 喜爱控制器
    HFJLikeTableViewController *likeTabVC = [[HFJLikeTableViewController alloc] init];
    likeTabVC.tableView.x = CGRectGetMaxX(sortTabVC.collectionView.frame);
    [self.myScrollView addSubview:likeTabVC.tableView];
    [self addChildViewController:likeTabVC];

}



#pragma mark - HFJTitleButtonViewDelegate 代理方法

// 点击按钮切换tableView
- (void)titleButtonViewDidClickButton:(NSInteger)tag
{
    [UIView animateWithDuration:HFJViewMovedTime animations:^{
        
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
