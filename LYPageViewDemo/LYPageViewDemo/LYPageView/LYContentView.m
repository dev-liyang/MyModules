//
//  LYContentView.m
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYContentView.h"

@interface LYContentView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *childVcs;
@property (nonatomic, strong) UIViewController *parentVc;

@end

@implementation LYContentView
{
    CGFloat startOffsetX;
    NSInteger currentIndex;
    BOOL isForbidScroll;    //是否禁止滑动
}

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSMutableArray *)childVcs parentVc:(UIViewController *)parentVc{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.childVcs = childVcs;
        self.parentVc = parentVc;
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //1.将子控制器添加到父控制器中
    for (UIViewController *vc in _childVcs) {
        [_parentVc addChildViewController:vc];
    }
    
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.itemSize = self.bounds.size;
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flow];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellIden"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIden" forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIViewController *childVc = _childVcs[indexPath.row];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
    
    return cell;
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    startOffsetX = scrollView.contentOffset.x;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    startOffsetX = scrollView.contentOffset.x;
    NSInteger index = startOffsetX / self.bounds.size.width;
    
    if (_delegate) {
        [_delegate contentViewDidScrollEnd:self atSelectedIndex:index];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isForbidScroll = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (isForbidScroll) return;
    
    CGFloat curtOffset = scrollView.contentOffset.x;
    CGFloat contentWidth = self.bounds.size.width;
    
    NSInteger curtIndex = startOffsetX / contentWidth;
    NSInteger targetIndex = 0;
    CGFloat progress = 0;

    if (curtOffset > startOffsetX) { //左滑
        if (curtIndex == self.childVcs.count - 1) {
            return;
        }
        targetIndex = curtIndex + 1;
        progress = (curtOffset - startOffsetX) / contentWidth;
    } else { //右滑
        if (curtIndex == 0) {
            return;
        }
        targetIndex = curtIndex - 1;
        progress = (startOffsetX - curtOffset) / contentWidth;
    }
    
    if (_delegate) {
        [_delegate contentViewDidScroll:self targetIndex:targetIndex progress:progress];
    }
}

#pragma mark - LYTitleViewDelegate
- (void)titleView:(LYTitleView *)titleView didSelectedIndex:(NSInteger)index{
    isForbidScroll = YES;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionLeft) animated:YES];
}

@end
