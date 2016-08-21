//
//  HorizontalCollectionView.h
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//滚动方向
typedef NS_ENUM(NSUInteger, ScrollDirection) {
    ScrollDirectionHorizontal = 0<<1,
    ScrollDirectionVertical
};


@interface HorizontalCollectionView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic,strong)  UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong)  UICollectionView *collectionView;

@property (nonatomic,strong)  NSMutableArray *dataSource;   //获取数据源

@property (nonatomic,assign)  BOOL isCyclicRolling;         //是否支持循环滚动

@property (nonatomic,assign)  ScrollDirection direction;    //方向

@end
