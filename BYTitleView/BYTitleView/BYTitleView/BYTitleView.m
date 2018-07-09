//
//  BYTitleView.m
//  BYTitleView
//
//  Created by mac on 2018/7/9.
//  Copyright © 2018年 byhuang. All rights reserved.
//

#import "BYTitleView.h"
#import "UIView+Extension.h"

@interface BYTitleView()

@property (nonatomic ,strong)NSArray *titlesArray;

@property(nonatomic,strong)UIFont *titleFont;

@property(nonatomic,assign)CGFloat totalWidth;


/**
 长度数组
 */
@property(nonatomic,strong)NSArray *titlesWidthArray;
/**
 选中时颜色
 */
@property(nonatomic,strong)UIColor *highlightedColor;
/**
 默认颜色
 */
@property(nonatomic,strong)UIColor *normalColor;

@end


@implementation BYTitleView

- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titlesArray = array;
        self.titleFont = [UIFont systemFontOfSize:16];
        [self initSubViews];
        
        
    }
    return self;
}

/**
 初始化子view
 */
- (void)initSubViews{
    
    self.titlesWidthArray = [self getTitlesWidthArray];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    //设置scrollview的contentSize
    scrollView.contentSize = CGSizeMake(self.totalWidth, self.height);

    scrollView.backgroundColor = [UIColor redColor];
    
    [self addSubview:scrollView];
    
    
    UILabel *lastLabel;
    for(int i =0;i<self.titlesArray.count - 1;i++){
        UILabel *label;
        if(lastLabel != nil){
            
            label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lastLabel.frame), 0, [self.titlesWidthArray[i] floatValue], self.height)];
        }else{
            label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [self.titlesWidthArray[i] floatValue], self.height)];
            
            
        }
        label.font = self.titleFont;
        label.textColor = [UIColor blackColor];
        label.text = self.titlesArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label];
        
        lastLabel = label;
        
    }
    
    //添加对应的按钮
    //添加对应文字
    
    
    
}







/**
 计算字符串的高度
 */
- (CGFloat)stringWidthWithString:(NSString *)string{
    NSDictionary *attribute = @{NSFontAttributeName: self.titleFont};
    CGSize size = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.width;
}

/**
 获取全部的数组
 */
- (NSArray *)getTitlesWidthArray{
    
    NSMutableArray *widthArray = [NSMutableArray array];
    
    CGFloat totalWidth = 0;
    for (NSString *title in self.titlesArray) {
        //加上两边的间隔
        CGFloat width = [self stringWidthWithString:title] + 10;
        [widthArray addObject:[NSNumber numberWithFloat:width]];
        totalWidth += width;
    }
    self.totalWidth = totalWidth;
    
    
    return widthArray;

}

- (CGFloat)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width

{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [value boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.width;
    
}


@end











