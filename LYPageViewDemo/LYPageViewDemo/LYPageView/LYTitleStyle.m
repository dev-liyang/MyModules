//
//  LYTitleStyle.m
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTitleStyle.h"

@implementation LYTitleStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _textTopMargin = [UIApplication sharedApplication].statusBarFrame.size.height;
        _textHeight = 44.0;
        _font = [UIFont systemFontOfSize:15.0];
        _labelHoriPadding = 20.0;
        _labelMaxWidth = 100.0;
        _normalColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _selectColor = [UIColor colorWithRed:255/255.0 green:127/255.0 blue:0 alpha:1];
        _markLineColor = _selectColor;
        
        _markLineHeight = 2;
    }
    return self;
}

@end
