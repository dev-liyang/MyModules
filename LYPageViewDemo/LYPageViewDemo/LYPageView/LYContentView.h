//
//  LYContentView.h
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTitleView.h"

@class LYContentView;
@protocol LYContentViewDelegate
- (void)contentViewDidScrollEnd:(LYContentView *)contentView atSelectedIndex:(NSInteger)index;
- (void)contentViewDidScroll:(LYContentView *)contentView targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress;

@end

@interface LYContentView : UIView <LYTitleViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, weak) id<LYContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSMutableArray *)childVcs parentVc:(UIViewController *)parentVc;

@end
