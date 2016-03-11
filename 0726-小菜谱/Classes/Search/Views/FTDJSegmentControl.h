//
//  CZSegmentControl.h
//  06-QQZone
//
//  Created by apple on 14-7-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTDJSegmentControl;

/**
 *  按钮点击代理,传递按钮的角标给代理方
 */
@protocol FTDJSegmentControlDelegate <NSObject>

- (void)segmentControl:(FTDJSegmentControl *)segementControl didSelectedSegmentIndex:(NSInteger)index;

@end

@interface FTDJSegmentControl : UIView
/**
 *  接收外界传入的按钮标题
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  当前选中的索引
 */
@property(nonatomic,assign) NSInteger selectedSegmentIndex;

@property (nonatomic, weak) id<FTDJSegmentControlDelegate> selectedDelegate;
@end
