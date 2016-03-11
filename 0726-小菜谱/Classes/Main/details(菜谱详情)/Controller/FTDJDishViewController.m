//
//  FTDJDishViewController.m
//  0726-小菜谱
//
//  Created by FTDjflydove on 14-7-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJDishViewController.h"
#import "UIBarButtonItem+addItem.h"
#import "SWTData.h"
#import "FTDJCollectMenuTool.h"
#import "SWTHeaderView.h"
#import "SWTStep.h"
#import "SWTFrameModel.h"
#import "SWTStepCell.h"

@interface FTDJDishViewController ()

@property (nonatomic, strong) NSArray *frameList;

@end

@implementation FTDJDishViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // 取出分割线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"io6background"]];
        
        // 设置导航条
        [self setupNavBar];

    }
    return self;
}

// 设置导航条
- (void)setupNavBar
{
    // 设置导航栏的titleView, 收藏/删除收藏按钮在setDictData方法里面
    UIView *navBar = [[UIView alloc] init];
    navBar.size = CGSizeMake(220, 44);
    self.navigationItem.titleView = navBar;
    
    // 给navBar添加一个文字标签
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.size = CGSizeMake(100, 44);
    label.center = navBar.center;
    [navBar addSubview:label];
    label.text = @"   烹饪步骤";
    label.font = [UIFont systemFontOfSize:19];
  
}



// 冲写set方法, 取出步骤模型数组
- (void)setFoodModel:(SWTData *)foodModel
{
    _foodModel = foodModel;
    
    // 根据不走设置frame模型数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (SWTStep *step in self.foodModel.steps) {
        
        SWTFrameModel *frameModel = [[SWTFrameModel alloc] init];
        frameModel.stepModel = step;
        [arrayM addObject:frameModel];
    }
    
    _frameList = [arrayM copy];
    
    
    // 收藏/删除收藏按钮
    UIButton *collect = nil;
    
    // 如果数据库中,有本条菜谱数据
    if ([FTDJCollectMenuTool searchMenu:self.foodModel]) {
        // 显示删除按钮
        collect = [UIBarButtonItem buttonImage:@"delete" highlightedImage:@"delete-h" target:self action:@selector(collectOrDelete:)];
    }else{
        
        // 显示收藏按钮
        collect = [UIBarButtonItem buttonImage:@"likeno" highlightedImage:@"like" target:self action:@selector(collectOrDelete:)];
    }
    
    // 设置按钮的位置,并添加到导航栏
    collect.size = CGSizeMake(20, 18);
    collect.center = CGPointMake(190, 22);
    [self.navigationItem.titleView addSubview:collect];
    
    // 设置头部的view
    SWTHeaderView *headerView = [[SWTHeaderView alloc] initWithFoodModel:self.foodModel];
    
    self.tableView.tableHeaderView = headerView;
    
}



// 收藏/取消收藏按钮 点击事件
- (void)collectOrDelete:(UIButton *)collect
{
    // 隐藏按钮
    collect.hidden = YES;
    
    // 从数据库获取最新的数据
    if ([FTDJCollectMenuTool searchMenu:self.foodModel]) {

        // 从数据库里面搜索到菜谱, 删除收藏的菜谱
        BOOL success = [FTDJCollectMenuTool deleteMenu:self.foodModel];
        
        // 蒙版提示
        if (success) {
            
            // pop到上一级控制器
            [self.navigationController popViewControllerAnimated:YES];
            
            [MBProgressHUD showSuccess:@"删除成功!"];
            
        }else{
            
            [MBProgressHUD showError:@"删除失败!"];
        }
        
    }else{
    
        // 如果没有搜索到菜谱收藏喜爱的菜谱
        BOOL success = [FTDJCollectMenuTool saveCollectMenus:self.foodModel];
        
        // 蒙版提示
        if (success) {

            [MBProgressHUD showSuccess:@"收藏成功!"];
        }else{
            [MBProgressHUD showError:@"收藏失败!"];
        }
    }
}




#pragma mark 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _frameList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SWTStepCell *cell = [SWTStepCell cellWithTableView:tableView];
    cell.frameModel = _frameList[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWTFrameModel *frameModel =  _frameList[indexPath.row];
    return [frameModel height];
}




@end
