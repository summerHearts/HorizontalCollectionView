//
//  HorizontalCollectionCell.h
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCell.h"

static NSString *const HorizontalCollectionCellIdentifier = @"HorizontalCollectionCellIdentifier";
@interface HorizontalCollectionCell : BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
