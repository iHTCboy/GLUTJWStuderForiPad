//
//  TCShowNewViewController.m
//  GLUTJWS
//
//  Created by HTC on 14/11/24.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCShowNewViewController.h"
#import "DXAlertView.h"

#define showImageCount 6

@interface TCShowNewViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation TCShowNewViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    //导航栏属性
//    UIImageView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
//    ((UIImageView *)_navView).backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
//    [self.view addSubview:_navView];
//    _navView.userInteractionEnabled = YES;
//    
//    
//    //标题
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.frame.size.width - 200)/2, (_navView.frame.size.height - 20)/2, 200, 40)];
//    [titleLabel setText:@"帮助"];
//    [titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [titleLabel setTextColor:[UIColor whiteColor]];
//    [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
//    [titleLabel setBackgroundColor:[UIColor clearColor]];
//    [_navView addSubview:titleLabel];
//    
//    
//    //左栏
//    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [lbtn setFrame:CGRectMake(10, 20, 40, 40)];
//    [lbtn setImage:[UIImage imageNamed:@"navigationbar_back_os7@2x"] forState:UIControlStateNormal];
//    lbtn.adjustsImageWhenHighlighted = NO;
//    [lbtn addTarget:self action:@selector(backMove) forControlEvents:UIControlEventTouchUpInside];
//    [_navView addSubview:lbtn];
    
    
    // 1.添加UISrollView
    [self setupScrollView];
    
    // 2.添加pageControl
    [self setupPageControl];
}



/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    // 1.添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = showImageCount;
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height - 10;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor =[UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    // 2.添加图片
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    for (int index = 0; index< showImageCount; index++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        

        NSString * name = nil;
        
       name = [NSString stringWithFormat:@"show%d", index + 1];
        
        imageView.image = [UIImage imageNamed:name];
        
        // 设置frame
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
        [scrollView addSubview:imageView];
        
        // 在最后一个图片上面添加按钮
        if (index == showImageCount - 1)
        {
            [self setupLastImageView:imageView];
        }
    }
    
    // 3.设置滚动的内容尺寸
    scrollView.contentSize = CGSizeMake(imageW * showImageCount, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

/**
 *  添加内容到最后一个图片
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 0.让imageView能跟用户交互
    imageView.userInteractionEnabled = YES;
    
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc] init];
    
    [startButton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1]];
    
    startButton.layer.cornerRadius = 3.5;
    startButton.layer.masksToBounds = YES;
    
    // 2.设置frame
    CGFloat centerX = imageView.frame.size.width * 0.5;
    CGFloat centerY = imageView.frame.size.height * 0.8;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.frame = CGRectMake(self.view.frame.size.width * 0.15, self.view.center.y * 1.2, self.view.frame.size.width * 0.7, 70);
    startButton.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    
    
    // 3.设置文字
    [startButton setTitle:@"开始使用" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    
}


/**
 *  只要UIScrollView滚动了,就会调用
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}

/**
 *  进入登陆界面
 */
- (void)start
{
    // 显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
   
    [self backMove];

}


-(void)backMove
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}



@end
