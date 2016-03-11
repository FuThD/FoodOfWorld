//
//  CZSegmentControl.m
//  06-QQZone
//
//  Created by apple on 14-7-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FTDJSegmentControl.h"
#import "FTDJSegment.h"

@interface FTDJSegmentControl()
{
    NSInteger _selectedSegmentIndex;
}
@property (nonatomic, weak) FTDJSegment *currentSelectedBtn;

@end

@implementation FTDJSegmentControl

// 设置按钮标题
- (void)setItems:(NSArray *)items
{
    _items = items;
    NSUInteger count = _items.count;
    for (int i = 0; i < count; i++) {
        FTDJSegment *btn = [[FTDJSegment alloc] init];
        btn.tag = i;
        [btn setTitle:_items[i] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        // 设置背景
        NSString *bgName = nil;
        NSString *selectedBgName = nil;
        if (i == 0)
        { // 最左边
            bgName = @"SegmentedControl_Left_Normal";
            selectedBgName = @"SegmentedControl_Left_Selected";
        } else if (i == (count - 1))
        { // 最右边
            bgName = @"SegmentedControl_Right_Normal";
            selectedBgName = @"SegmentedControl_Right_Selected";
//        } else { // 中间
//            bgName = @"SegmentedControl_Normal";
//            selectedBgName = @"SegmentedControl_Selected";
        }
        [btn setBackgroundImage:[UIImage resizableImageNamed:bgName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage resizableImageNamed:selectedBgName] forState:UIControlStateSelected];
        
        // 监听按钮点击事件
        [btn addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置文字颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
}

// 按钮的点击时间
- (void)segmentClick:(FTDJSegment *)btn
{
    self.currentSelectedBtn.selected = NO;
    btn.selected = YES;
    self.currentSelectedBtn = btn;
    
    // 调用代理方法, 隐藏/显示 清除记录按钮
    if ([self.selectedDelegate respondsToSelector:@selector(segmentControl:didSelectedSegmentIndex:)]) {
        
        [self.selectedDelegate segmentControl:self didSelectedSegmentIndex:btn.tag];
    }
}

// 布局子视图, 设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger count = self.subviews.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    for (int i = 0; i < count; i++) {
        FTDJSegment *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.y = 0;
        btn.x = i * btnW;
    }
}

// 按钮的选中index的set方法
- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        if (i == _selectedSegmentIndex) {
            FTDJSegment *btn = self.subviews[i];
            [self segmentClick:btn];
        }
    }
}

// 按钮的选中index的get方法
- (NSInteger)selectedSegmentIndex
{
    return self.currentSelectedBtn.tag;
}
@end
