//
//  HFJSearchHeadView.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchHeadView.h"

@interface HFJSearchHeadView()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

/**
 *  清除按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

@end

@implementation HFJSearchHeadView

/**
 *  加载xib的view
 */
+ (instancetype)searchHeadView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HFJSearchHeadView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    // 监听segmented的点击事件
    [self.segmentControl addTarget:self action:@selector(segmentControlDidClick) forControlEvents:UIControlEventValueChanged];
    
    // 设置字体颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [self.segmentControl setTitleTextAttributes:dict forState:UIControlStateNormal];
    // 设置tintColor
    self.segmentControl.tintColor = [UIColor colorWithRed:180/255. green:180/255. blue:180/255. alpha:1];

}

// segmentControl点击事件
- (void)segmentControlDidClick
{
    // 设置清除记录按钮的状态
    if (self.segmentControl.selectedSegmentIndex) {
        
        self.clearBtn.hidden = NO;
    }else{
    
        self.clearBtn.hidden = YES;
    }
    
    // 代用代理方法
    if ([self.delegate respondsToSelector:@selector(searchHeadView:didSelectedIndex:)]) {
        
        [self.delegate searchHeadView:self didSelectedIndex:self.segmentControl.selectedSegmentIndex];
    }

}

// 清除按钮的点击事件,清理历史记录
- (IBAction)clearBtnClick:(UIButton *)sender
{
    // 调用代理方法,隐藏清除历史记录的按钮, 点击了清理历史记录,就要把按钮隐藏掉
    if ([self.delegate respondsToSelector:@selector(searchHeadView:didClickClearBtn:)]) {
        
        [self.delegate searchHeadView:self didClickClearBtn:sender];
    }
}

@end
