//
//  HorizontalCollectionView.m
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import "HorizontalCollectionView.h"
#import "HorizontalCollectionCell.h"
@implementation HorizontalCollectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self shareInitWithFrame:frame];
    }
    return self;
}

- (void)shareInitWithFrame:(CGRect)frame{
    _flowLayout = [UICollectionViewFlowLayout new];
    _flowLayout.itemSize                    = CGSizeMake(frame.size.width, frame.size.height);
    _flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
    _flowLayout.minimumInteritemSpacing     = 0;
    _flowLayout.minimumLineSpacing          = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.frame
                                                          collectionViewLayout:_flowLayout];
    collectionView.pagingEnabled                  = YES;
    collectionView.bounces                        = NO;
    collectionView.showsVerticalScrollIndicator   = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.delegate   = self;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:@"HorizontalCollectionCell" bundle:nil] forCellWithReuseIdentifier:HorizontalCollectionCellIdentifier];
    _collectionView = collectionView;
    [self addSubview:_collectionView];
}


- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = [dataSource mutableCopy];
    if (self.isCyclicRolling) {
        if (dataSource.count > 1){
            [_dataSource insertObject:dataSource[dataSource.count - 1] atIndex:0];
            [_dataSource addObject:dataSource[0]];
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionNone
                                            animated:NO];
        }else{
            _collectionView.scrollEnabled = NO;
        }
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

- (HorizontalCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HorizontalCollectionCell *cell = (HorizontalCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:HorizontalCollectionCellIdentifier forIndexPath:indexPath];
    [cell loadCellData:_dataSource[indexPath.item]];
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark 移动位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.direction == ScrollDirectionHorizontal) {
        if (self.isCyclicRolling) {
            CGFloat offsetX = scrollView.contentOffset.x;
            if (offsetX >= (_dataSource.count - 1) * _collectionView.bounds.size.width){
                [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionLeft
                                                animated:NO];
            }else if (offsetX <= 0.0f){
                [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_dataSource.count - 2 inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionRight
                                                animated:NO];
            }
        }
       
    }else{
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY >= (_dataSource.count - 1) * _collectionView.bounds.size.height){
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionTop
                                            animated:NO];
        }else if (offsetY <= 0.0f){
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_dataSource.count - 2 inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionBottom
                                            animated:NO];
        }
    }
}

#pragma mark UIScrollView 滚动方向
- (void)setDirection:(ScrollDirection)direction{
    _direction = direction;
    switch (direction) {
        case 0:{
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        }
            break;
        case 1:{
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

        }
            break;
        default:
            break;
    }
}

@end
