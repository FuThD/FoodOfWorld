//
//  ZWPeiLiaoView.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTMaterialView.h"
#import "SWTFoodMaterialModel.h"

@interface SWTMaterialView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLanel;
@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;

@end

@implementation SWTMaterialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setMaterialModel:(SWTFoodMaterialModel *)materialModel
{
    _materialModel = materialModel;
    _nameLanel.text = _materialModel.name;
    _capacityLabel.text = _materialModel.capacity;
}

+ (instancetype)materialView
{
   return [[[NSBundle mainBundle] loadNibNamed:@"SWTMaterialView" owner:nil options:nil] firstObject];
}

@end
