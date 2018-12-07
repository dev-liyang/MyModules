//
//  CDContentViewController.m
//  OC-LYPageView设计
//
//  Created by liyang on 2018/5/2.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "CDContentViewController.h"

@interface CDContentViewController ()

@end

@implementation CDContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%256)/255.0 green:(arc4random()%256)/255.0 blue:(arc4random()%256)/255.0 alpha:1];
}


@end
