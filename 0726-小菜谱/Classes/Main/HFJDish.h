//
//  HFJDish.h
//  0726-小菜谱导航栏
//
//  Created by hfjflydove on 14-7-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFJDish : NSObject

//burden
//albums
//id
//title

/**
 *  材料
 */
@property (nonatomic, copy) NSString * burden;

/**
 *  配图
 */
@property (nonatomic, copy) NSArray * albums;

//@property (nonatomic, copy) NSNumber * id;

/**
 *  标题
 */
@property (nonatomic, copy) NSString * title;

@end
