//
//  ZWHeaderView.m
//  01-分类列表
//
//  Created by czw-apc on 14-8-2.
//  Copyright (c) 2014年 czw. All rights reserved.
//

// 控件间隙
#define margin 10
// 大图宽度
#define SWTHeaderViewPicW 300
// 大图高度
#define SWTHeaderViewPicH 200
#define screenSize [UIScreen mainScreen].bounds.size
#define titleFont [UIFont boldSystemFontOfSize:25]
#define imtroFont [UIFont systemFontOfSize:18]
#define stepFont [UIFont boldSystemFontOfSize:20]

#import "SWTHeaderView.h"
#import "CPData.h"
#import "UIImageView+WebCache.h"
#import "SWTMaterialContentView.h"
#import "SWTInsetsLabel.h"
#import "SWTFoodMaterialModel.h"

@interface SWTHeaderView ()
// 标题
@property (weak, nonatomic) UILabel *titleLabel;
// 大图(效果)
@property (weak, nonatomic) UIImageView *picView;
// 介绍
@property (weak, nonatomic) SWTInsetsLabel *imtroLabel;
// 做法步骤
@property (weak, nonatomic) UILabel *stepLabel;
// 主料视图
@property (nonatomic, weak) SWTMaterialContentView *ingredientsView;
// 辅料视图
@property (nonatomic, weak) SWTMaterialContentView *burdenView;

@end


@implementation SWTHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/**
 *  添加子控件
 */
- (void)setupView
{
    // 添加标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = titleFont;
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    // 配图
    UIImageView *picView = [[UIImageView alloc] init];
    picView.layer.cornerRadius = 5;
    picView.clipsToBounds = YES;
    picView.contentMode = UIViewContentModeScaleAspectFill;
    self.picView = picView;
    [self addSubview:picView];
    
    // 介绍
    SWTInsetsLabel *imtroLabel = [[SWTInsetsLabel alloc] init];
    imtroLabel.layer.cornerRadius = 3;
    imtroLabel.layer.masksToBounds = YES;
    imtroLabel.numberOfLines = 0;
    imtroLabel.font = imtroFont;
    self.imtroLabel = imtroLabel;
    [self addSubview:imtroLabel];
    
    // 主料视图
    SWTMaterialContentView *ingredientsView = [[SWTMaterialContentView alloc] initWithArray:[self materialWithString:_foodModel.ingredients] title:@"主料"];
    self.ingredientsView = ingredientsView;
    [self addSubview:ingredientsView];
    
    // 辅料视图
    SWTMaterialContentView *burdenView = [[SWTMaterialContentView alloc] initWithArray:[self materialWithString:_foodModel.burden] title:@"辅料"];
    self.burdenView = burdenView;
    [self addSubview:burdenView];

    // 步骤
    UILabel *stepLabel = [[UILabel alloc] init];
    stepLabel.backgroundColor = [UIColor clearColor];
    stepLabel.numberOfLines = 0;
    stepLabel.font = stepFont;
    self.stepLabel = stepLabel;
    stepLabel.text = [NSString stringWithFormat:@"%@的做法步骤:", _foodModel.title];
    [self addSubview:stepLabel];
    
}

/**
 *  设置子控件的Frame
 *
 *  @return 总高度
 */
- (CGFloat)setupFrame
{
    // 菜谱名字
    CGFloat titleX = margin;
    CGFloat titleY = margin;
    CGFloat titleW = screenSize.width - titleX * 2;
    CGSize titleSize = [_foodModel.title sizeWithFont:titleFont constrainedToSize:CGSizeMake(titleW, MAXFLOAT)];
    _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleSize.height);
    
    // 大图
    CGFloat picY = CGRectGetMaxY(_titleLabel.frame) + margin;
    CGFloat picW = SWTHeaderViewPicW;
    CGFloat picH = SWTHeaderViewPicH;
    CGFloat picX = (screenSize.width - picW) * 0.5;
    _picView.frame = CGRectMake(picX, picY, picW, picH);
    
    // 介绍
    CGFloat imtroX = titleX;
    CGFloat imtroY = CGRectGetMaxY(_picView.frame) + margin;
    CGFloat imtroW = screenSize.width - imtroX * 2;
    CGSize imtroSize = [_foodModel.imtro sizeWithFont:imtroFont constrainedToSize:CGSizeMake(imtroW - Inset, MAXFLOAT)];
    _imtroLabel.frame  = CGRectMake(imtroX, imtroY, imtroW, imtroSize.height + Inset * 2);
    
    // 主料
    CGRect ingredientsViewFrame = _ingredientsView.frame;
    ingredientsViewFrame.origin.x = 0;
    ingredientsViewFrame.origin.y = CGRectGetMaxY(_imtroLabel.frame) + margin;
    _ingredientsView.frame = ingredientsViewFrame;
    
    // 辅料
    CGRect burdenViewFrame = _burdenView.frame;
    burdenViewFrame.origin.x = 0;
    burdenViewFrame.origin.y = CGRectGetMaxY(_ingredientsView.frame) + margin * 0.5;
    _burdenView.frame = burdenViewFrame;
    
    // 做法步骤
    CGFloat stepX = titleX;
    CGFloat stepY = CGRectGetMaxY(_burdenView.frame) + margin * 2;
    CGFloat stepW = screenSize.width - stepX * 2;
    CGSize stepSize = [_stepLabel.text sizeWithFont:imtroFont constrainedToSize:CGSizeMake(stepW, MAXFLOAT)];
    _stepLabel.frame  = CGRectMake(stepX, stepY, stepW, stepSize.height);
    
    return CGRectGetMaxY(_stepLabel.frame) + margin;
}

/**
 *  设置数据
 */
- (void)setupData
{
    self.titleLabel.text = _foodModel.title;
    [self.picView sd_setImageWithURL:[NSURL URLWithString:_foodModel.albums[0]] placeholderImage:[UIImage imageNamed:@"placeholder_Pic"]];
    self.imtroLabel.text = [NSString stringWithFormat:@"       %@", _foodModel.imtro];
}

- (instancetype)initWithFoodModel:(CPData *)foodModel
{
    _foodModel = foodModel;
    self = [super init];
    if (self) {

        // 添加子控件
        [self setupView];
        // 设置数据
        [self setupData];
        // 设置Frame
        self.frame = CGRectMake(0, 0, screenSize.width, [self setupFrame]);
    }
    return self;
}

// 将配料字符组格式化为配料数组
- (NSArray *)materialWithString:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@";"];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSString *str in array) {
        NSArray *array2 = [str componentsSeparatedByString:@","];
        NSDictionary *dict = @{@"name":[array2 firstObject],
                               @"capacity":[array2 lastObject]};
        [arrayM addObject:[SWTFoodMaterialModel materialModelWithDict:dict]];
    }
    return [arrayM copy];
}
@end
