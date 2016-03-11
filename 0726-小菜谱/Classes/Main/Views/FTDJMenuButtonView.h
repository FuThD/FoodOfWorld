//
//  FTDJTitleButtonView.h
//  0721- 小菜谱
//
//  Created by FTDjflydove on 14-7-25.
//  Copyright (c) 2014年 itcast. All rights reserved.
// 菜单按钮的大view 精品/分类/喜爱

#import <UIKit/UIKit.h>
@class FTDJMenuButtonView;

/**
 *  点击按钮,切换tableView的代理方法
 */
@protocol FTDJTitleButtonViewDelegate <NSObject>

- (void)titleButtonViewDidClickButton:(NSInteger)tag;

@end

@interface FTDJMenuButtonView : UIView


/**
 *  被选中按钮的角标
 */
@property (nonatomic, assign) NSInteger i;
/**
 *  scrollView contentOffset.x 相对于tableView总个数 -1 的 屏幕宽度 滑动的比例
 */
@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, weak) id<FTDJTitleButtonViewDelegate> delegate;

@end
