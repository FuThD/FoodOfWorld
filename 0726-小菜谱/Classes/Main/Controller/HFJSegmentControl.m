//
//  CZSegmentControl.m
//  06-QQZone
//
//  Created by apple on 14-7-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJSegmentControl.h"
#import "HFJSegment.h"

@interface HFJSegmentControl()
{
    int _selectedSegmentIndex;
}
@property (nonatomic, weak) HFJSegment *currentSelectedBtn;

@end

@implementation HFJSegmentControl

- (void)setItems:(NSArray *)items
{
    _items = items;
    int count = _items.count;
    for (int i = 0; i < count; i++) {
        HFJSegment *btn = [[HFJSegment alloc] init];
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
        } else { // 中间
            bgName = @"SegmentedControl_Normal";
            selectedBgName = @"SegmentedControl_Selected";
        }
        [btn setBackgroundImage:[UIImage resizableImageNamed:bgName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage resizableImageNamed:selectedBgName] forState:UIControlStateSelected];
        
        // 监听按钮点击事件
        [btn addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置文字颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
}

- (void)segmentClick:(HFJSegment *)btn
{
    self.currentSelectedBtn.selected = NO;
    btn.selected = YES;
    self.currentSelectedBtn = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    int count = self.subviews.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    for (int i = 0; i < count; i++) {
        HFJSegment *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.y = 0;
        btn.x = i * btnW;
    }
    
}

- (void)setSelectedSegmentIndex:(int)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    
    for (int i = 0; i < self.subviews.count; i++) {
        if (i == _selectedSegmentIndex) {
            HFJSegment *btn = self.subviews[i];
            [self segmentClick:btn];
        }
    }
}

- (int)selectedSegmentIndex
{
    return self.currentSelectedBtn.tag;
}
@end
