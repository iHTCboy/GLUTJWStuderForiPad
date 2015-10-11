//
//  SubViewController.m
//  testMyBackNavigation
//
//  Created by chen on 14-3-25.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (id)initWithFrame:(CGRect)frame  andURL:(NSURL *)jwURL andTitle:(NSString *)navTitle
{
    self = [super init];
    if (self)
    {
        self.jwURL = jwURL;
        self.navTitle = navTitle;
        self.view.frame = frame;

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    
    //导航栏属性
    UIImageView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
    ((UIImageView *)_navView).backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.frame.size.width - 200)/2, (_navView.frame.size.height - 20)/2, 200, 40)];
    [titleLabel setText:self.navTitle];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [_navView addSubview:titleLabel];
    
    
    //左栏
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(10, 20, 40, 40)];
    [lbtn setImage:[UIImage imageNamed:@"navigationbar_back_os7@2x"] forState:UIControlStateNormal];
    lbtn.adjustsImageWhenHighlighted = NO;
    [lbtn addTarget:self action:@selector(backMove) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:lbtn];

    
    
    
    UIWebView * jwWeb = [[UIWebView alloc ]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    jwWeb.backgroundColor = [UIColor whiteColor];
    jwWeb.scalesPageToFit = YES;
    
    [self.view addSubview:jwWeb];
    
    
    NSURLRequest *jwRequest = [NSURLRequest requestWithURL:self.jwURL];
    
    [jwWeb loadRequest:jwRequest];
    
    [jwWeb reload];


}


-(void)backMove
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
   
}



@end
