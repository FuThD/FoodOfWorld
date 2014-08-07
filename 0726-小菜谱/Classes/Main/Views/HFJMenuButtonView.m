//
//  HFJTitleButtonView.m
//  0721- 小菜谱
//
//  Created by hfjflydove on 14-7-25.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HFJMenuButtonView.h"
//#import "HFJTitleBtn.h"

@interface HFJMenuButtonView()

/**
 *  底部灰色的线
 */
@property (nonatomic, strong) UIView *lineView;

/**
 *  标题按钮数组 精选/分类/喜爱
 */
@property (nonatomic, strong) NSMutableArray *titleBtns;

/**
 *  当前被选中的标题按钮
 */
@property (nonatomic, strong) UIButton *selectedBtn;

/**
 *  选中标题按钮底部的橙色的线
 */
@property (nonatomic, strong) UIView *titleBtnLineView;




@end

@implementation HFJMenuButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.设置背景颜色
        self.backgroundColor = [UIColor whiteColor];
        
        // 2.设置底部灰色的线
        [self setButtomLine];
        
        // 3.设置标题按钮
        [self setButtons];
        
        // 4.设置标题按钮底部橙色的线
        [self setTitleBtnLineView];
    }
    return self;
}


// 3.设置菜单按钮
- (void)setButtons
{
    [self setButtonWithTitle:@"精选" addTarget:self action:@selector(titleBtnClick:)];
    [self setButtonWithTitle:@"分类" addTarget:self action:@selector(titleBtnClick:)];
    [self setButtonWithTitle:@"喜爱" addTarget:self action:@selector(titleBtnClick:)];
}

- (void)titleBtnClick:(UIButton *)btn
{
    // 设置按钮的选中状态
    self.selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    self.selectedBtn = btn;
    
    // 动画移动标题按钮底部橙色的线
    [UIView animateWithDuration:HFJViewMovedTime animations:^{

        // 代理方调用代理方法
        if ([self.delegate respondsToSelector:@selector(titleButtonViewDidClickButton:)]) {
            
            [self.delegate titleButtonViewDidClickButton:btn.tag];
        }
    }];
    
}




/**
 *  初始化一个标题按钮
 */
- (UIButton *)setButtonWithTitle:(NSString *)title addTarget:(id)target action:(SEL)action
{
    // 初始化按钮
    UIButton *btn = [[UIButton alloc] init];
    
    // 设置按钮的标题,文字颜色
    [btn setTitle:title forState:UIControlStateNormal];
    // 设置按钮的字体,颜色
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
    // 添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到父视图中,添加到数组中
    [self addSubview:btn];
    [self.titleBtns addObject:btn];
    
    // 设置按钮的tag
    btn.tag = self.titleBtns.count - 1;
    
    // 默认选择第一个按钮
    if (self.titleBtns.count == 1) {
        btn.selected = YES;
        self.selectedBtn = btn;
    }
    
    return btn;
    
}

// 设置底部灰色的先
- (void)setButtomLine
{
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];

}

// 4.设置标题按钮底部橙色的线
- (void)setTitleBtnLineView
{
    self.titleBtnLineView = [[UIView alloc] init];
    self.titleBtnLineView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.titleBtnLineView];

}

// 布局子视图
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置底部灰色的先的frame
    self.lineView.frame = CGRectMake(5, self.height - 2, self.width - 10, 1);
    
    // 设置3个标题按钮的先
    int count = self.titleBtns.count;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.titleBtns[i];
        
        // 设置按钮的frame
        btn.height = self.height;
        btn.width = self.width / count;
        btn.y = 0;
        btn.x = i * btn.width;
    }
    
    // 设置标题按钮底部橙色的线
    self.titleBtnLineView.frame = CGRectMake(5, self.height - 4, 100, 3);

}

#pragma mark - 重写角标i的set方法 设置按钮的被选中状态
- (void)setI:(NSInteger)i
{
    _i = i;
    
    self.selectedBtn.selected = NO;
    
    self.selectedBtn = self.titleBtns[i];
    
    self.selectedBtn.selected = YES;
}

// 设置标题按钮底部橙色的线的位置
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    self.titleBtnLineView.x = 5 + progress * ((self.titleBtns.count - 1) / (CGFloat)self.titleBtns.count) * self.width;

}

#pragma mark - 懒加载
- (NSMutableArray *)titleBtns
{
    if (_titleBtns == nil) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}

@end
