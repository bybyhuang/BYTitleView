//
//  BYTitleView.h
//  BYTitleView
//
//  Created by mac on 2018/7/9.
//  Copyright © 2018年 byhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYTitleView : UIView


- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray *)array;
@end


@interface BYTitleButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text withFont:(UIFont *)font withColor:(UIColor *)color withSelectedColor:(UIColor *)selectedColor;
@end


