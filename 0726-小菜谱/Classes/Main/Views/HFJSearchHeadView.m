//
//  HFJSearchHeadView.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchHeadView.h"

@interface HFJSearchHeadView()


@end

@implementation HFJSearchHeadView


+ (instancetype)searchHeadView
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    return [[bundle loadNibNamed:@"HFJSearchHeadView" owner:nil options:nil] lastObject];
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.titleBtn setTitle:@"清空历史记录" forState:UIControlStateNormal];
        
    }
    return self;
}

// 清除按钮的点击事件
- (IBAction)clearBtnClick:(UIButton *)sender
{
    // 清除历史搜索记录
#warning 待编写清理记录的代码
    
    // 调用代理方法,隐藏清除历史记录的按钮, 点击了清理历史记录,就要把按钮隐藏掉
    if ([self.delegate respondsToSelector:@selector(searchHeadView:didClickClearBtn:)]) {
        
        [self.delegate searchHeadView:self didClickClearBtn:sender];
    }
}

@end
