//
//  HFJTitleView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJTitleView.h"
#import "HFJSearchView.h"

@interface HFJTitleView()


@end

@implementation HFJTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = HFJBasicColor;
        
        // app名字的按钮
        UIButton *nameBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        
        // 设置nameBtn的属性
        [nameBtn setImage:[UIImage imageNamed:@"nd_icon"] forState:UIControlStateDisabled];
        [nameBtn setTitle:@"小  菜  谱" forState:UIControlStateNormal];
        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        nameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        nameBtn.enabled = NO;
        [self addSubview:nameBtn];

        
        // 搜索按钮
        UIButton *search = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 120, 44)];
        
        // 设置按钮的属性
        [search setImage:[UIImage imageNamed:@"06-magnify"] forState:UIControlStateNormal];
        [search setTitle:@"搜 索" forState:UIControlStateNormal];
        [search setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        search.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [self addSubview:search];

        // 添加搜索按钮的监听事件
        [search addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
                
    }
    return self;
}

// 添加搜索按钮的监听事件
- (void)searchBtnClick
{
    HFJSearchView *searchView = [[HFJSearchView alloc] init];
    
    [self.superview addSubview:searchView];

}





@end
