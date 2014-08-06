//
//  SWTIngredientsView.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//


#define screenSize [UIScreen mainScreen].bounds.size
#import "SWTMaterialContentView.h"
#import "SWTMaterialView.h"
#define margin 10
#define titleLaleFont [UIFont boldSystemFontOfSize:20]

@interface SWTMaterialContentView ()
// 材料数组
@property (nonatomic, strong) NSArray *array;
// 标题
@property (nonatomic, copy) NSString *title;
// 标题label
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation SWTMaterialContentView

/**
 *  添加子控件
 */
- (void)setupView
{
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = titleLaleFont;
    titleLabel.textColor = [UIColor blackColor];
    self.titleLabel = titleLabel;
    titleLabel.text = _title;
    [self addSubview:titleLabel];
    
    
    // 材料列表
    for (int i = 0; i < _array.count; i++) {
        SWTMaterialView *materialView = [SWTMaterialView materialView];
        materialView.materialModel = _array[i];
        materialView.tag = i;
        [self addSubview:materialView];
    }
}

/**
 *  设置子控件Frame
 *
 *  @return 总高度
 */
- (CGFloat)setupViewsFrame
{
    // 标题
    CGFloat titleX = margin;
    CGFloat titleW = screenSize.width - margin - 2 * titleX;
    CGSize titleSize = [_title sizeWithFont:titleLaleFont constrainedToSize:CGSizeMake(titleW, MAXFLOAT)];
    self.titleLabel.frame = CGRectMake(margin, 0, titleSize.width, titleSize.height);
    
    // 材料列表
    for (UIView *materialView in self.subviews) {
        if([materialView isKindOfClass:[SWTMaterialView class]])
        {
            CGRect temp = materialView.frame;
            temp.origin.x = margin + (materialView.tag % 2) * temp.size.width;
            temp.origin.y = materialView.tag / 2 * temp.size.height + CGRectGetMaxY(_titleLabel.frame);
            materialView.frame = temp;
        }
    }

    SWTMaterialView *materialView = [self.subviews lastObject];
    // 返回总高度
    return CGRectGetMaxY(materialView.frame);
}

- (instancetype)initWithArray:(NSArray *)array title:(NSString *)title
{
    self = [super init];
    if (self) {
        _array = array;
        _title = title;
        // 添加子控件
        [self setupView];
        
        self.frame = CGRectMake(0, 0, screenSize.width, [self setupViewsFrame]);
    }
    return self;
}

@end
