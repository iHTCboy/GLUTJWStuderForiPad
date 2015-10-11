//
//  TCShowViewController.m
//  GLUTJWsystem
//
//  Created by joonsheng on 14-8-27.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCShowViewController.h"
#import "TCLoginViewController.h"
#import "DXAlertView.h"

#define showImageCount 6

@interface TCShowViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation TCShowViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
        
        // 设置图片
        NSString *name = nil;
    
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
    startButton.titleLabel.font = [UIFont boldSystemFontOfSize:35];
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
    
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:NO forKey:@"showLaunch"];
        [defaults synchronize];
        // 切换窗口的根控制器
        self.view.window.rootViewController = [[TCLoginViewController alloc]init];
        
        //[UIApplication sharedApplication].keyWindow.rootViewController = [[TCLoginViewController alloc]init];
        // 这里判断是否第一次


}


@end