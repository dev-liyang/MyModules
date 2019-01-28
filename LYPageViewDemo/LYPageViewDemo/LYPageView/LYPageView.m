//
//  LYPageView.m
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYPageView.h"
#import "LYTitleView.h"
#import "LYTitleStyle.h"
#import "LYContentView.h"

@interface LYPageView () <LYContentViewDelegate>
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *childVcs;
@property (nonatomic, strong) UIViewController *parentVc;
@property (nonatomic, strong) LYTitleStyle *titleStyle;
@property (nonatomic, strong) LYTitleView *titleView;
@property (nonatomic, strong) LYContentView *contentView;

@end

@implementation LYPageView


- (instancetype)initWithFrame:(CGRect)frame titles:(NSMutableArray *)titles childVcs:(NSMutableArray *)childVcs parentVc:(UIViewController *)parentVc titleStyle:(LYTitleStyle *)titleStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        self.childVcs = childVcs;
        self.parentVc = parentVc;
        self.titleStyle = titleStyle;
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat titleViewHeight = _titleStyle.textTopMargin + _titleStyle.textHeight;
    CGRect frame = CGRectMake(0, 0, width, titleViewHeight);
    _titleView = [[LYTitleView alloc] initWithFrame:frame titles:_titles titleStyle:_titleStyle];
    [self addSubview:_titleView];
    
    CGFloat contentH = height - titleViewHeight;
    CGRect contentFrame = CGRectMake(0, titleViewHeight, width, contentH);
    _contentView  = [[LYContentView alloc] initWithFrame:contentFrame childVcs:_childVcs parentVc:_parentVc];
    [self addSubview:_contentView];
    
    _titleView.delegate = _contentView;
    _contentView.delegate = self;
    
}
#pragma mark - LYContentViewDelegate
- (void)contentViewDidScrollEnd:(LYContentView *)contentView atSelectedIndex:(NSInteger)index{
    [_titleView didScrollEndWithTargetIndex:index];
}
-(void)contentViewDidScroll:(LYContentView *)contentView targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress{
    [_titleView didScrollWithTargetIndex:targetIndex progress:progress];
}

@end
