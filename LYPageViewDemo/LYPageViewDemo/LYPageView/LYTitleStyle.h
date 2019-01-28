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
    TitleAlignType_Center,       //居中靠拢(适合3个及一下的title)
};

@interface LYTitleStyle : NSObject

@property (nonatomic, assign) CGFloat textTopMargin;    //文字顶部间隙 defaul=statusBarHeight
@property (nonatomic, assign) CGFloat textHeight;       //文字高度 default=44.0
@property (nonatomic, strong) UIFont  *font;            //字体 defaultSize=15.0
@property (nonatomic, assign) CGFloat labelHoriPadding; //label水平方向内间距 default=20.0
@property (nonatomic, assign) CGFloat labelMaxWidth;    //label最大宽度 default=100.0
@property (nonatomic, strong) UIColor *normalColor;     //默认颜色
@property (nonatomic, strong) UIColor *selectColor;     //选中颜色
@property (nonatomic, strong) UIColor *markLineColor;   //标识线颜色
@property (nonatomic, strong) UIColor *backgroundColor; //titleView的背景颜色
@property (nonatomic, assign) TitleAlignType alignType; //排列模式


/**
 标识下滑线宽度
 defaul=0（和文字内容宽度保持一致）
 markLineWidth=-1（和labelf所占宽度一致）
 */
@property (nonatomic, assign) CGFloat markLineWidth;
@property (nonatomic, assign) CGFloat markLineHeight;       //标识下滑线高度，defaul=2


@end
