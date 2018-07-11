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


/**
 获取点击title的下标
 */
@property(nonatomic,copy)void(^getClickIndex)(NSInteger index);

/**
 设置选中的下标
 */
- (void)selectIndex:(NSInteger)index;
@end


@interface BYTitleButton : UIButton

@property(nonatomic,assign)NSInteger index;

- (instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text withFont:(UIFont *)font withColor:(UIColor *)color withSelectedColor:(UIColor *)selectedColor;



@end


