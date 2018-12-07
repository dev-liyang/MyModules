//
//  LYTitleView.h
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYTitleStyle, LYTitleView;

@protocol LYTitleViewDelegate
//点击title选项卡
- (void)titleView:(LYTitleView *)titleView didSelectedIndex:(NSInteger)index;
@end

@interface LYTitleView : UIView

@property (nonatomic, weak) id<LYTitleViewDelegate> delegate;

//自定义实例化方法
- (instancetype)initWithFrame:(CGRect)frame titles:(NSMutableArray *)titles titleStyle:(LYTitleStyle *)titleStyle;

// 滑动停止设置title选中项
- (void)didScrollEndWithTargetIndex:(NSInteger)targetIndex;

//设置mark的farme
- (void)didScrollWithTargetIndex:(NSInteger)targetIndex progress:(CGFloat)progress;

@end
