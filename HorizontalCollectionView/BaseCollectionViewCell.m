//
//  BaseCollectionViewCell.m
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
#pragma mark - Life Cycle

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    [self initViews];
}

#pragma mark - SubViews UI

- (void)initViews{
    // subClass
}

#pragma mark - Public Methods

- (void)loadCellData:(id)data{
    // subClass
}

- (void)loadCellData:(id)data indexPath:(NSIndexPath *)indexPath{
    // subClass
}


@end
