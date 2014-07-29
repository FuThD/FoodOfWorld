//
//  HFJSearchController.m
//  0726-小菜谱
//
//  Created by hfjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchTableViewController.h"
#import "HFJMainCell.h"
#import "HFJSearchHeadView.h"

@interface HFJSearchTableViewController ()<HFJSearchHeadViewDelegate>



@end

@implementation HFJSearchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype) init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置tableView背景颜色
    self.tableView.backgroundColor = HFJBasicColor;
    
    // 设置tableView头部标题代理
    self.headView.delegate = self;
    
    // 取出分割线,
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
#warning 分割线用图片,cell的背景图片底部留一条灰线,只有cell有内容,才显示图片,否者不显示
    
   
   
}


// 开始拖拽表格
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:)])
    {
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self];
    }
}

#pragma mark - Table view data source / delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"search";
    HFJMainCell *cell = [HFJMainCell cellWithTableView:tableView reuseIdentifier:ID];
    
    cell.textLabel.text = @"123";
    
    return cell;
}


// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 调用代理方法, 关闭键盘
    if ([self.searchDelegate respondsToSelector:@selector(searchControllerBeginDraggingORDidSelectedCell:)])
    {        
        [self.searchDelegate searchControllerBeginDraggingORDidSelectedCell:self];
    }
}

// 设置tableView头部的view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headView;
}

// 设置tableView头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35.0;
}

#pragma mark - HFJSearchHeadViewDelegate 代理方法
- (void)searchHeadView:(HFJSearchHeadView *)searchHeadView didClickClearBtn:(UIButton *)clearBtn
{
    /** 隐藏表格的headview */
    [self hiddenHeadView];
}

/** 隐藏表格的headview */
- (void)hiddenHeadView
{
    // 代理方法,隐藏headview,
    self.headView.hidden = YES;
    // tableView顶上内边距缩进headview的高度,
    CGFloat top = self.headView.height;
    [UIView animateWithDuration:0.5 animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(-top, 0, 0, 0);
    }];

}
#pragma mark - 懒加载
- (HFJSearchHeadView *)headView
{
    if (_headView == nil) {
        _headView = [HFJSearchHeadView searchHeadView];
    }
    return _headView;
}

// 重写set方法.设置传递过来的标题文字
//- (void)setHeadViewTitle:(NSString *)headViewTitle
//{
//    _headViewTitle = headViewTitle;
//    
//    self.headView.titleBtn.titleLabel.text = headViewTitle;
//}
@end
