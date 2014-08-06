//
//  ZWSortCell.m
//  01-分类列表
//
//  Created by czw-apc on 14-7-30.
//  Copyright (c) 2014年 czw. All rights reserved.
//

#import "SWTSortCell.h"
#import "SWTFoodCategory.h"

@interface SWTSortCell ()
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation SWTSortCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setCategory:(SWTFoodCategory *)category
{
    _category = category;
    self.titleLabel.text = _category.name;
}

+ (instancetype)cellWithCollectView:(UICollectionView *)collectView IndexPath:(NSIndexPath *)indexPath
{
    
    SWTSortCell *cell = [collectView dequeueReusableCellWithReuseIdentifier:SWTSortCellIdentifier forIndexPath:indexPath];
    
    if(!cell)
    {
        cell = [[SWTSortCell alloc] init];
        cell.restorationIdentifier = SWTSortCellIdentifier;
    }
    return cell;
    
}

@end
