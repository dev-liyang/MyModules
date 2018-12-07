//
//  LYPageView.h
//  OC-LYPageView设计
//
//  Created by liyang on 2018/5/2.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYTitleStyle;

@interface LYPageView : UIView


- (instancetype)initWithFrame:(CGRect)frame titles:(NSMutableArray *)titles childVcs:(NSMutableArray *)childVcs parentVc:(UIViewController *)parentVc titleStyle:(LYTitleStyle *)titleStyle;

@end
