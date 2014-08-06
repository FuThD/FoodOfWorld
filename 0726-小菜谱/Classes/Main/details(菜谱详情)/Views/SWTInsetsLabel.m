//
//  SWTInsetsLabel.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTInsetsLabel.h"

@implementation SWTInsetsLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {Inset, Inset, Inset, Inset};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
