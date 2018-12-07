//
//  LYTitleStyle.h
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TitleAlignType) {
    TitleAlignType_Default = 0,  //总宽度小于屏幕宽度时，等分处理，大于则水平依次排列
    TitleAlignType_Center,       //居中靠拢
};

@interface LYTitleStyle : NSObject

@property (nonatomic, assign) CGFloat titleTopMargin;   //头部间隙
@property (nonatomic, assign) CGFloat titleHeight;      //标题高度
@property (nonatomic, assign) CGFloat fontSize;         //字体大小
@property (nonatomic, assign) CGFloat labelHoriPadding; //label水平方向内间距
@property (nonatomic, assign) CGFloat labelMaxWidth;    //label最大宽度
@property (nonatomic, strong) UIColor *normalColor;     //默认颜色
@property (nonatomic, strong) UIColor *selectColor;     //选中颜色
@property (nonatomic, assign) TitleAlignType alignType; //排列模式

@property (nonatomic, assign) CGFloat markLineWidth;        //标识下滑线宽度，defaul=0（和文字内容宽度保持一致）
@property (nonatomic, assign) CGFloat markLineHeight;       //标识下滑线高度


@end
