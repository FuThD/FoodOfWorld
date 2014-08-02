//
//  CZSegmentControl.h
//  06-QQZone
//
//  Created by apple on 14-7-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFJSegmentControl : UIView
/**
 *  接收外界传入的按钮标题
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  当前选中的索引
 */
@property(nonatomic,assign) int selectedSegmentIndex;
@end
