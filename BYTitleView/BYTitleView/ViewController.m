//
//  ViewController.m
//  BYTitleView
//
//  Created by mac on 2018/7/9.
//  Copyright © 2018年 byhuang. All rights reserved.
//

#import "ViewController.h"
#import "BYTitleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *titles = @[@"你好",@"测来了试",@"真是6",@"啊哈哈哈是是",@"09090",@"你好",@"测来了试",@"真是6",@"啊哈哈哈是是",@"09090"];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    BYTitleView *titleView = [[BYTitleView alloc] initWithFrame:CGRectMake(0, 100,375, 44) titlesArray:titles];
    
    
    [self.view addSubview:titleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
