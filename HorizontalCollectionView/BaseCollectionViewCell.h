//
//  BaseCollectionViewCell.h
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell
/**
 *  载入Cell数据
 */

- (void)loadCellData:(id)data;

- (void)loadCellData:(id)data indexPath:(NSIndexPath *)indexPath;

/**
 *  加载UI样式
 */

- (void)initViews;


@end
