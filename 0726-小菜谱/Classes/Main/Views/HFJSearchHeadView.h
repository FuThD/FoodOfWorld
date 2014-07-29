//
//  HFJSearchHeadView.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HFJSearchHeadView;

@protocol HFJSearchHeadViewDelegate <NSObject>

- (void)searchHeadView:(HFJSearchHeadView *)searchHeadView didClickClearBtn:(UIButton *)clearBtn;

@end


@interface HFJSearchHeadView : UIView

+ (instancetype)searchHeadView;

// 标题
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

@property (nonatomic, weak) id<HFJSearchHeadViewDelegate> delegate;

@end
