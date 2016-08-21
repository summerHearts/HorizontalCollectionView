//
//  HorizontalCollectionCell.m
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import "HorizontalCollectionCell.h"

@implementation HorizontalCollectionCell


- (void)loadCellData:(NSString *)data{
    self.contentLabel.text = data;
}
@end
