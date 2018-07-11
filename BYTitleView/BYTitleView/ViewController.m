//
//  ViewController.m
//  BYTitleView
//
//  Created by mac on 2018/7/9.
//  Copyright © 2018年 byhuang. All rights reserved.
//

#import "ViewController.h"
#import "BYTitleView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic ,weak)BYTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *titles = @[@"你好",@"测来了试",@"真是6",@"啊哈哈哈是是",@"09090",@"你好",@"测来了试",@"真是6",@"啊哈哈哈是是",@"09090"];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    BYTitleView *titleView = [[BYTitleView alloc] initWithFrame:CGRectMake(0, 0,375, 44) titlesArray:titles];
    self.navigationItem.titleView = titleView;
    [titleView setGetClickIndex:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
    
    self.titleView = titleView;
    
    //第二个
    
    BYTitleView *titleView2 = [[BYTitleView alloc] initWithFrame:CGRectMake(0, 100,375, 44) titlesArray:titles font:[UIFont systemFontOfSize:17] normalColor:[UIColor grayColor] highlightedColor:[UIColor blueColor] backgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:titleView2];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, 375, 200)];
    scrollView.pagingEnabled = true;
    scrollView.contentSize = CGSizeMake(375*titles.count, 200);
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.delegate = self;
    
    
    
    [self.view addSubview:scrollView];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    NSInteger index = scrollView.contentOffset.x / 375;
    NSLog(@"%ld",index);
    [self.titleView selectIndex:index];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
