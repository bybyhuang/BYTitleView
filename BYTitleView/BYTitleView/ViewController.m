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
   
    NSArray *titles = @[@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33",@"11",@"22",@"33"];
    BYTitleView *titleView = [[BYTitleView alloc] initWithFrame:CGRectMake(0, 0,370, 44) titlesArray:titles];
    self.navigationItem.titleView = titleView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
