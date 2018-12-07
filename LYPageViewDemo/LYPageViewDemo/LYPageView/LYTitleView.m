//
//  LYTitleView.m
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTitleView.h"
#import "LYTitleStyle.h"

@interface LYTitleView()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) LYTitleStyle *titleStyle;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *titleLabels;
@property (nonatomic, strong) UIView *markLineView;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, assign) BOOL isScrolling;//正在滑动中
@property (nonatomic, assign) CGFloat contentViewOffset;
@property (nonatomic, assign) CGRect markLineViewRect;

@end

@implementation LYTitleView
{
    CGFloat allLabelsFrameWidth;
    CGFloat allLabelsContentWidth;
    NSMutableArray *labelsFrameWidthArr;
    NSMutableArray *labelsContentWidthArr;
    
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSMutableArray *)titles titleStyle:(LYTitleStyle *)titleStyle{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titles = titles;
        self.titleStyle = titleStyle;
        self.titleLabels = [NSMutableArray array];
        labelsFrameWidthArr = [NSMutableArray array];
        labelsContentWidthArr = [NSMutableArray array];
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //添加scrollView
    [self scrollView];
    
    //添加markLineView
    [self markLineView];
    
    //初始化title选项卡
    [self setupLabels];
    
    //设置选项卡frame
    [self setupLablesFrame];
}

#pragma mark - Setup
- (void)setupLabels{
    [_titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:_titleStyle.fontSize];
        label.text = obj;
        label.textColor = idx == 0 ? _titleStyle.selectColor : _titleStyle.normalColor;
        label.tag = idx;
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)]];
        [_scrollView addSubview:label];
        
        [_titleLabels addObject:label];
    }];
    
}
- (void)setupLablesFrame{
    
    BOOL isScroll = [self getContentIsScroll];
    
    CGFloat x = 0;
    CGFloat y = _titleStyle.titleTopMargin;
    CGFloat w = 0;
    CGFloat h = _titleStyle.titleHeight;
    NSInteger count = _titleLabels.count;
    
    if (_titleStyle.alignType == TitleAlignType_Default) {
        
    } else if (_titleStyle.alignType == TitleAlignType_Center) {
        x = (self.bounds.size.width - allLabelsFrameWidth)*0.5;
    }
    
    for (int i = 0; i < count; i ++){
        
        UILabel *label = _titleLabels[i];
        
        if (_titleStyle.alignType == TitleAlignType_Default) {
            
            if (isScroll) { //title滚动
                w = [labelsFrameWidthArr[i] floatValue];
                
            } else { //title不滚动
                w = self.bounds.size.width / count;
            }
            
        } else if (_titleStyle.alignType == TitleAlignType_Center) {
            w = [labelsFrameWidthArr[i] floatValue];
        }
        
        label.frame = CGRectMake(x, y, w, h);
        
        x += w;
        
        if (i == 0) {
            [self setmarkLineViewFrame];
        }
    }
    if (isScroll) {
        self.scrollView.contentSize = CGSizeMake(allLabelsFrameWidth, self.bounds.size.height);
    }else{
        self.scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, _scrollView.bounds.size.height);
    }
}

// 设置title选中项
- (void)setSelectedTitle:(NSInteger)selectedIndex{
    if (selectedIndex == _currentIndex) {return;}
    
    _contentViewOffset = selectedIndex * self.bounds.size.width;
    
    UILabel * beforeLabel = _titleLabels[_currentIndex];
    UILabel * selectLabel = _titleLabels[selectedIndex];
    
    _currentIndex = selectedIndex;
    
    //1.设置颜色变换
    beforeLabel.textColor = _titleStyle.normalColor;
    selectLabel.textColor = _titleStyle.selectColor;
    
    //2.设置偏移
    CGFloat offset = selectLabel.center.x - _scrollView.bounds.size.width * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    if (offset > _scrollView.contentSize.width - _scrollView.bounds.size.width) {
        offset = _scrollView.contentSize.width - _scrollView.bounds.size.width;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = CGPointMake(offset, 0);
    }];
    
    //3.设置markLineView 的Frame
    [self setmarkLineViewFrame];
}

//设置选项卡frame
- (void)setmarkLineViewFrame{
    UILabel *label = _titleLabels[_currentIndex];

    CGFloat markW = _titleStyle.markLineWidth;
    if (markW == 0) {
        markW = [labelsContentWidthArr[_currentIndex] floatValue];
    }

    CGRect frame = _markLineView.frame;
    frame.origin.x = label.center.x - markW*0.5;
    frame.size.width = markW;
    [UIView animateWithDuration:0.25 animations:^{
        _markLineView.frame = frame;
        _markLineViewRect = frame;
    }];

}

#pragma mark - Public Method
- (void)didScrollEndWithTargetIndex:(NSInteger)targetIndex{
    [self setSelectedTitle:targetIndex];
}

//设置mark的farme
- (void)didScrollWithTargetIndex:(NSInteger)targetIndex progress:(CGFloat)progress{
    
    //当前bottomLine
    CGFloat curtW = _titleStyle.markLineWidth;
    if (curtW == 0) {
        curtW = [labelsContentWidthArr[_currentIndex] floatValue];
    }
    UILabel *curtLabel = _titleLabels[_currentIndex];
    CGFloat curtLabelX = curtLabel.frame.origin.x + (curtLabel.bounds.size.width - curtW)*0.5;
    
    //目标bottomLine
    CGFloat targetW = _titleStyle.markLineWidth;
    if (targetW == 0) {
       targetW = [labelsContentWidthArr[targetIndex] floatValue];
    }
    UILabel *targetLabel = _titleLabels[targetIndex];
    CGFloat targetLabelX = targetLabel.frame.origin.x + (targetLabel.bounds.size.width - targetW)*0.5;
    
    //差值
    CGFloat differenceX = targetLabelX - curtLabelX;
    CGFloat differenceW = targetW - curtW;
    
    //渐变
    CGRect frame = _markLineViewRect;
    frame.origin.x += differenceX*progress;
    frame.size.width += differenceW*progress;
    
    _markLineView.frame = frame;
    
}

#pragma mark - Actions
- (void)titleLabelClick:(UITapGestureRecognizer *)sender{
    UILabel *label = (UILabel *)sender.view;
    NSInteger index = label.tag;
    
    [self setSelectedTitle:index];
    
    if (_delegate) {
        [_delegate titleView:self didSelectedIndex:index];
    }
}

#pragma mark - Help Method
- (CGFloat)getTextWidth:(NSString *)text{
    return [text boundingRectWithSize:CGSizeMake(_titleStyle.labelMaxWidth, _titleStyle.titleHeight) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:_titleStyle.fontSize]} context:nil].size.width;
}

- (BOOL)getContentIsScroll{
    ///这段代码主要是判断当前的标题排版是否应该滑动显示
    BOOL isScroll = NO;
    for (NSString *title in _titles) {
        
        CGFloat labelContentW = [self getTextWidth:title];
        CGFloat labelFrameW = labelContentW + _titleStyle.labelHoriPadding*2;
        
        [labelsContentWidthArr addObject:@(labelContentW)];
        [labelsFrameWidthArr addObject:@(labelFrameW)];
        
        allLabelsContentWidth += labelContentW;
        allLabelsFrameWidth += labelFrameW;
    }
    if (allLabelsFrameWidth > self.frame.size.width) {
        isScroll = YES;
    }
    return isScroll;
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:self.scrollView];
    }
    return _scrollView;
}

- (UIView *)markLineView{
    if (!_markLineView) {
        _markLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - _titleStyle.markLineHeight, 0, _titleStyle.markLineHeight)];
        _markLineView.backgroundColor = _titleStyle.selectColor;
        [self.scrollView addSubview:_markLineView];
    }
    return _markLineView;
}

@end
