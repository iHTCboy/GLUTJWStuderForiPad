//
//  MainAppViewController.m
//  helloworld
//
//  Created by chen on 14/7/13.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MainAppViewController.h"
#import "SliderViewController.h"
#import "SubViewController.h"
#import "TCSchooolMottoViewController.h"


@interface MainAppViewController ()

@end

@implementation MainAppViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏属性
    UIView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
    ((UIImageView *)_navView).backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.frame.size.width - 200)/2, (_navView.frame.size.height - 20)/2, 200, 40)];
    [titleLabel setText:@"桂林理工大学"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [_navView addSubview:titleLabel];
    
    
    //左栏
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(0, 20, 40, 40)];
    [lbtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    lbtn.adjustsImageWhenHighlighted = NO;
    [lbtn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:lbtn];
    
    
    //右栏
    UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rbtn setFrame:CGRectMake(_navView.frame.size.width - 40, 20, 40, 40)];
    //[rbtn setTitle:@"右" forState:UIControlStateNormal];
    [rbtn setImage:[UIImage imageNamed:@"right_btn"] forState:UIControlStateNormal];
    rbtn.adjustsImageWhenHighlighted = NO;
    [rbtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:rbtn];
    

    //首页图片
    UIImageView * homeView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height * 0.55)];
    homeView.image = [UIImage imageNamed:@"homes560.png"];
    [self.view addSubview:homeView];
    
    //底部背影
    UIImageView * buttomView =[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height * 0.55 + 64 , self.view.frame.size.width, self.view.frame.size.height * 0.5)];
    buttomView.image = [UIImage imageNamed:@"homeBtn228.jpg.png"];
    [self.view addSubview:buttomView];
    
    
    
    //校历按钮
    UIButton * canderBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.center.y * 5/4, (self.view.frame.size.width - 5 * 4)/3 -20, 25)];
    [canderBtn setImage:[UIImage imageNamed:@"cander35.png"] forState:UIControlStateNormal];
    [canderBtn setTitle:@" 校历" forState:UIControlStateNormal];
    [canderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    canderBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    canderBtn.adjustsImageWhenDisabled = NO;
    [canderBtn addTarget:self action:@selector(canderBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:canderBtn];
    


    //作息按钮
    UIButton * sleepBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 5 * 4)/3 -3, self.view.center.y * 5/4 , (self.view.frame.size.width - 5 * 4)/3 + 4, 25)];
    [sleepBtn setImage:[UIImage imageNamed:@"sleep35.png"] forState:UIControlStateNormal];
    [sleepBtn setTitle:@" 作息时间" forState:UIControlStateNormal];
    [sleepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sleepBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    sleepBtn.adjustsImageWhenDisabled = NO;
    [sleepBtn addTarget:self action:@selector(sleepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sleepBtn];
    
    
    //关于桂工按钮
    UIButton * glutBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 5 * 4)/3 * 2 +15, self.view.center.y * 5/4, (self.view.frame.size.width - 5 * 4)/3 + 5, 25)];
    [glutBtn setImage:[UIImage imageNamed:@"glutBtn35.png"] forState:UIControlStateNormal];
    [glutBtn setTitle:@" 关于桂工" forState:UIControlStateNormal];
    [glutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    glutBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    glutBtn.adjustsImageWhenDisabled = NO;
    [glutBtn addTarget:self action:@selector(glutBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:glutBtn];
    
    
    //校训
    //厚德笃学 惟实励新
    UIButton * qifeBtn = [[UIButton alloc ]initWithFrame:CGRectMake(5, self.view.center.y * 4.9/4 + 50, self.view.frame.size.width / 2 - 10, self.view.frame.size.height * 0.15)];
    [qifeBtn setBackgroundImage:[UIImage imageNamed:@"qifeBtn300.png"] forState:UIControlStateNormal];
    [qifeBtn setTitle:@"厚德" forState:UIControlStateNormal];
    [qifeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    qifeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    qifeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    qifeBtn.adjustsImageWhenDisabled = NO;
    [qifeBtn addTarget:self action:@selector(qifeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qifeBtn];
    
    //笃学
    UIButton * qishiBtn = [[UIButton alloc ]initWithFrame:CGRectMake(self.view.frame.size.width /2, self.view.center.y * 4.9/4 + 50, self.view.frame.size.width /2 - 10, self.view.frame.size.height * 0.15)];
    [qishiBtn setBackgroundImage:[UIImage imageNamed:@"qishiBtn300.png"] forState:UIControlStateNormal];
    [qishiBtn setTitle:@"笃学" forState:UIControlStateNormal];
    [qishiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    qishiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    qishiBtn.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    qishiBtn.adjustsImageWhenDisabled = NO;
    [qishiBtn addTarget:self action:@selector(qishiBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qishiBtn];
 
    //惟实
    UIButton * qisiBtn = [[UIButton alloc ]initWithFrame:CGRectMake(5, self.view.center.y * 4.9/4 + 60 + self.view.frame.size.height * 0.16, self.view.frame.size.width / 2 -10, self.view.frame.size.height * 0.15)];
    [qisiBtn setBackgroundImage:[UIImage imageNamed:@"qisiBtn300.jpg"] forState:UIControlStateNormal];
    [qisiBtn setTitle:@"惟实" forState:UIControlStateNormal];
    [qisiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    qisiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    qisiBtn.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    qisiBtn.adjustsImageWhenDisabled = NO;
    [qisiBtn addTarget:self action:@selector(qisiBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qisiBtn];
    
    
    //励新
    UIButton * kaitoBtn = [[UIButton alloc ]initWithFrame:CGRectMake(self.view.frame.size.width /2 ,self.view.center.y * 4.9/4 + 60 + self.view.frame.size.height * 0.16, self.view.frame.size.width /2 - 10, self.view.frame.size.height * 0.15)];
    [kaitoBtn setBackgroundImage:[UIImage imageNamed:@"kaitoBtn320.jpg"] forState:UIControlStateNormal];
    [kaitoBtn setTitle:@"励新" forState:UIControlStateNormal];
    [kaitoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    kaitoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    kaitoBtn.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    kaitoBtn.adjustsImageWhenDisabled = NO;
    [kaitoBtn addTarget:self action:@selector(kaitoBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kaitoBtn];
    
    
}

//校历
-(void)canderBtn
{
    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"校历" andTag:5];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];


}

//作息时间
-(void)sleepBtn
{

    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"作息时间" andTag:6];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];
    
}

//关于桂工
-(void)glutBtn
{
    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"桂林理工大学" andTag:7];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];

}

//校训
//厚德笃学 惟实励新
-(void)qifeBtn
{

    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"厚德" andTag:1];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];


}

//笃学
-(void)qishiBtn
{

    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"笃学" andTag:2];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];
    
}

//惟实
-(void)qisiBtn
{

    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"惟实" andTag:3];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];

}

//励新
-(void)kaitoBtn
{
    TCSchooolMottoViewController *motooViewController = [[TCSchooolMottoViewController alloc]initWithFrame:self.view.bounds andTitle:@"励新" andTag:4];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:motooViewController];

}


#pragma mark - action

- (void)leftAction:(UIButton *)btn
{
    [((SliderViewController *)[[[self.view superview] superview] nextResponder]) showLeftViewController];
}

- (void)rightAction:(UIButton *)btn
{
    [((SliderViewController *)[[[self.view superview] superview] nextResponder]) showRightViewController];
}


#pragma mark - 加载对应leftList
-(void)leftListSelectDelegate:(NSURL *)jwURL andTitle:(NSString *)jwTitle
{
 
    
    SubViewController *subViewController = [[SubViewController alloc]initWithFrame:self.view.bounds andURL:jwURL andTitle:(NSString *)jwTitle];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:subViewController];
 
    
}




@end


