//
//  ViewController.m
//  LYPageViewDemo
//
//  Created by liyang on 2018/12/6.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "CDContentViewController.h"
#import "LYPageView.h"
#import "LYTitleStyle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"要闻", @"新时代", @"娱乐"];
//    NSArray *arr = @[@"要闻", @"新时代", @"娱乐", @"推荐", @"体育", @"军事", @"财经"];
    NSMutableArray *titles = [NSMutableArray arrayWithArray:arr];
    NSMutableArray * childVcs = [NSMutableArray array];
    for (NSString *title in titles) {
        CDContentViewController * vc = [[CDContentViewController alloc] init];
        [childVcs addObject:vc];
    }
    
    LYTitleStyle *style = [[LYTitleStyle alloc] init];
    style.labelHoriPadding = 20;
//    style.markLineWidth = 60;
//    style.alignType = TitleAlignType_Center;
    
    LYPageView *pageView = [[LYPageView alloc] initWithFrame:self.view.bounds titles:titles childVcs:childVcs parentVc:self titleStyle:style];
    [self.view addSubview:pageView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
