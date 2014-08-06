//
//  ZWPeiLiaoView.h
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

// 显示单个配料View

#import <UIKit/UIKit.h>
@class SWTFoodMaterialModel;
@interface SWTMaterialView : UIView
@property (nonatomic, strong) SWTFoodMaterialModel *materialModel;
+ (instancetype)materialView;
@end
