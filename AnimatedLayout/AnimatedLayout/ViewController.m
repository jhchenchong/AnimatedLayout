//
//  ViewController.m
//  AnimatedLayout
//
//  Created by 浪漫恋星空 on 2017/3/23.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import "ViewController.h"
#import "XKCollectionViewCell.h"
#import "AnimatedCollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 100;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    CellModel *model = [[CellModel alloc] init];
    
    model.color = [self randomColor];
    
    model.string = [NSString stringWithFormat:@"%ld浪漫恋星空", indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- 私有方法

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/256.0 green:arc4random_uniform(255)/256.0 blue:arc4random_uniform(255)/256.0 alpha:1];
}

#pragma mark -- 懒加载
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        // ZoomInOutAttributesAnimator RotateInOutAttributesAnimator LinearCardAttributesAnimator
        AnimatedCollectionViewLayout *flowlayout = [[AnimatedCollectionViewLayout alloc] initWithAnimationType:NSClassFromString(@"RotateInOutAttributesAnimator")];
        
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        flowlayout.minimumLineSpacing = 0;
        
        flowlayout.minimumInteritemSpacing = 0;
        
        flowlayout.sectionInset = UIEdgeInsetsZero;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
        
        flowlayout.itemSize = _collectionView.bounds.size;
        
        _collectionView.dataSource = self;
        
        _collectionView.delegate = self;
        
        _collectionView.pagingEnabled = YES;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[XKCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    }
    return _collectionView;
}

@end
