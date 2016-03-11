//
//  FTDJSearchHeadView.h
//  0726-小菜谱导航栏
//
//  Created by FTDjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTDJSearchHeadView;

@protocol FTDJSearchHeadViewDelegate <NSObject>

// IOS6 点击了清除记录按钮
- (void)searchHeadView:(FTDJSearchHeadView *)searchHeadView didClickClearBtn:(UIButton *)clearBtn;

// IOS7 点击了segmentControl
- (void)searchHeadView:(FTDJSearchHeadView *)searchHeadView didSelectedIndex:(NSInteger)index;
@end


@interface FTDJSearchHeadView : UIView

+ (instancetype)searchHeadView;

// 标题
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

@property (nonatomic, weak) id<FTDJSearchHeadViewDelegate> delegate;

@end
