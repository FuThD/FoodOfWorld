//
//  HFJSearchHeadView.m
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSearchHeadView.h"
#import "HFJSegmentControl.h"

@interface HFJSearchHeadView()<HFJSegmentControlDelegate>

@property (weak, nonatomic) UISegmentedControl *segmentControl7; // ios7
@property (nonatomic, strong) HFJSegmentControl *segmentControl6; // ios6

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
    // 设置一个按钮的选择器
    [self setupSegmentControl];

    


}

// 设置一个按钮的选择器
- (void)setupSegmentControl
{
    if (iOS7) {
        
        // 如果是ios7 用系统的UISegmentedControl
        UISegmentedControl *segmentControl7 = [[UISegmentedControl alloc] initWithItems:@[@"热 门 搜 索", @"历 史 搜 索"]];
        self.segmentControl7 = segmentControl7;
        [self addSubview:self.segmentControl7];
        // 设置frame
        self.segmentControl7.size = CGSizeMake(160, 35);
        self.segmentControl7.center = self.center;
        
        // 监听segmented的点击事件
        [segmentControl7 addTarget:self action:@selector(segmentControlDidClick) forControlEvents:UIControlEventValueChanged];
        
        // 设置字体颜色
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSForegroundColorAttributeName] = [UIColor blackColor];
        [segmentControl7 setTitleTextAttributes:dict forState:UIControlStateNormal];
        
        // 设置tintColor
        self.segmentControl7.tintColor = [UIColor colorWithRed:170/255. green:170/255. blue:170/255. alpha:1];
        
        self.segmentControl7.selectedSegmentIndex = 0;
        
        
    }else{
    
        // 如果是ios6 用自定义的控件
        self.segmentControl6 = [[HFJSegmentControl alloc] init];
        [self addSubview:self.segmentControl6];
        
        // 设置代理
        self.segmentControl6.selectedDelegate = self;
        
        // 设置frame
        self.segmentControl6.size = CGSizeMake(160, 35);
        self.segmentControl6.center = self.center;
        
        // 设置按钮标题, 第0个按钮为默认选中按钮
        self.segmentControl6.items = @[@"热 门 搜 索", @"历 史 搜 索"];
        self.segmentControl6.selectedSegmentIndex = 0;
    
    }
}

// ios7 调用的方法
- (void)segmentControlDidClick
{
    // 设置清除记录按钮的状态
    if (self.segmentControl7.selectedSegmentIndex) {
        
        self.clearBtn.hidden = NO;
    }else{
        
        self.clearBtn.hidden = YES;
    }
    
    // 代用代理方法
    if ([self.delegate respondsToSelector:@selector(searchHeadView:didSelectedIndex:)]) {
        
        [self.delegate searchHeadView:self didSelectedIndex:self.segmentControl7.selectedSegmentIndex];
    }
}

// ios6 调用的方法
- (void)segmentControl:(HFJSegmentControl *)segementControl didSelectedSegmentIndex:(int)index
{
    // 设置清除记录按钮的状态
    if (self.segmentControl6.selectedSegmentIndex) {
        
        self.clearBtn.hidden = NO;
        
    }else{
        
        self.clearBtn.hidden = YES;
    }
    
    // 代用代理方法
    if ([self.delegate respondsToSelector:@selector(searchHeadView:didSelectedIndex:)]) {
        
        [self.delegate searchHeadView:self didSelectedIndex:self.segmentControl6.selectedSegmentIndex];
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
