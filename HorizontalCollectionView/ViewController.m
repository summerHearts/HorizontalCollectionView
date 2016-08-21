//
//  ViewController.m
//  HorizontalCollectionView
//
//  Created by Kenvin on 16/8/22.
//  Copyright © 2016年 上海方创金融股份服务有限公司. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalCollectionView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HorizontalCollectionView *horizontalCollectionView = [[HorizontalCollectionView alloc]initWithFrame:CGRectMake(0,
                                                                                                                   0,
                                                                                                                   [UIScreen mainScreen].bounds.size.width,
                                                                                                                   100)];
    [horizontalCollectionView setDirection:ScrollDirectionHorizontal];
    horizontalCollectionView.isCyclicRolling = YES;
    [self.view addSubview:horizontalCollectionView];
    [horizontalCollectionView setDataSource:[NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4"]]];
}

@end
