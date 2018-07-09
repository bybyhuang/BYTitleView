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


/**
 当前选中的按钮
 */
@property(nonatomic,strong)BYTitleButton *selectedButton;


@property(nonatomic,strong)UIView *buttonLine;


/**
 间隔
 */
@property(nonatomic,assign)CGFloat spaceWidth;



@end


@implementation BYTitleView

- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.spaceWidth = 15;
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

    scrollView.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:scrollView];
    
    
    
    BYTitleButton *lastButton;
    for(int i =0;i<self.titlesArray.count - 1;i++){
        BYTitleButton *titleButton;
        if(lastButton != nil){
            
            CGRect frame = CGRectMake(CGRectGetMaxX(lastButton.frame), 0, [self.titlesWidthArray[i] floatValue], self.height-1);
            
            titleButton = [[BYTitleButton alloc] initWithFrame:frame withText:self.titlesArray[i] withFont:self.titleFont withColor:[UIColor blackColor] withSelectedColor:[UIColor blueColor]];
         
        }else{
            CGRect frame = CGRectMake(0, 0, [self.titlesWidthArray[i] floatValue], self.height-1);
            
            titleButton = [[BYTitleButton alloc] initWithFrame:frame withText:self.titlesArray[i] withFont:self.titleFont withColor:[UIColor blackColor] withSelectedColor:[UIColor blueColor]];
            titleButton.selected = true;
            self.selectedButton = titleButton;
        }
       
        
        lastButton = titleButton;
        [scrollView addSubview:titleButton];
        [titleButton addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    
    CGRect lineFrame = CGRectMake(self.spaceWidth, self.height-2, [self.titlesWidthArray[0] floatValue]- self.spaceWidth*2, 2);
    
    //添加一条线
    UIView *line = [[UIView alloc] initWithFrame:lineFrame];
    line.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:line];
    self.buttonLine = line;
}


- (void)clickTitleButton:(BYTitleButton *)button{
    self.selectedButton.selected = false;
    button.selected = true;
    
    self.selectedButton = button;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect lineFrame = CGRectMake(button.x + self.spaceWidth, self.height-2, button.width - self.spaceWidth * 2, 2);
        self.buttonLine.frame = lineFrame;
    }];
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
        CGFloat width = [self stringWidthWithString:title] + self.spaceWidth * 2;
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






@implementation BYTitleButton

- (instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text withFont:(UIFont *)font withColor:(UIColor *)color withSelectedColor:(UIColor *)selectedColor {
    self = [super initWithFrame:frame];
    if(self){
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitleColor:selectedColor forState:UIControlStateSelected];
        self.titleLabel.font = font;
    }
    return self;
}

@end






