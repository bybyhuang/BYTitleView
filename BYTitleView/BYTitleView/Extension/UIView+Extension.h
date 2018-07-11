//
//  UIView+Extern.h
//
//
//  Created by huangbaoyu on 15/6/16.
//  Copyright (c) 2015年 huangbaoyu . All rights reserved.
//

#import <UIKit/UIKit.h>

#define BYScreenWidth [UIScreen mainScreen].bounds.size.width


@interface UIView (Extension)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;   

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;

@property (nonatomic) CGFloat bottom;
@end
