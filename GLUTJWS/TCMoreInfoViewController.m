//
//  TCMoreInfoViewController.m
//  GLUTJWS
//
//  Created by HTC on 14-10-11.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCMoreInfoViewController.h"
#import "MBProgressHUD+MJ.h"

@interface TCMoreInfoViewController ()

@end

@implementation TCMoreInfoViewController

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)mottoTitle andTag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        
        self.tag = tag;
        self.mottoTitle = mottoTitle;
        self.view.frame = frame;
        
    }
    
    return self;
}

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
    [titleLabel setText:self.mottoTitle];
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
    


    
    
    switch (self.tag)
    {
        case 0:
        {
            
            UIImageView * logoV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"JWslogomini.png"]];
            logoV.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.3);
            logoV.bounds = CGRectMake(0, 0, 220, 220);
            [self.view addSubview:logoV];
            
            
            UILabel * name = [[UILabel alloc]init];
            name.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.45);
            name.bounds = CGRectMake(0, 0, 500, 80);
            name.text = @"桂林理工大学教务在线";
            name.textAlignment = NSTextAlignmentCenter;
            name.font = [UIFont boldSystemFontOfSize:35];
            [self.view addSubview:name];
            
            
            UILabel * version = [[UILabel alloc]init];
            version.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.49);
            version.bounds = CGRectMake(0, 0, 180, 80);
            version.text = @"学生iPad版 V1.3";
            version.textAlignment = NSTextAlignmentCenter;
            version.font = [UIFont systemFontOfSize:23];
            [self.view addSubview:version];
            
            
            
            
//                //感谢
//            UILabel * thinkLab = [[UILabel alloc ]init];
//            thinkLab.center = CGPointMake(self.view.frame.size.width * 0.25, self.view.frame.size.height * 0.75);
//            thinkLab.bounds = CGRectMake(0, 0, 180, 80);
//            thinkLab.text = @"感谢:";
//            thinkLab.textAlignment = NSTextAlignmentCenter;
//            thinkLab.font = [UIFont boldSystemFontOfSize:25];
//            thinkLab.textColor = [UIColor blackColor];
//            [self.view addSubview:thinkLab];
//            
//            
//            
//                //name2
//            UILabel * name2 = [[UILabel alloc ]init];
//            name2.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.8);
//            name2.bounds = CGRectMake(0, 0, 320, 80);
//            name2.text = @"桂林理工大学 计算机协会";
//            name2.textAlignment = NSTextAlignmentCenter;
//            name2.font = [UIFont boldSystemFontOfSize:23];
//            name2.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
//            [self.view addSubview:name2];
//            
//                //name2。2
//            UILabel * name22 = [[UILabel alloc ]init];
//            name22.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.84);
//            name22.bounds = CGRectMake(0, 0,320, 80);
//            name22.text = @"2014会员群：346796885";
//            name22.textAlignment = NSTextAlignmentCenter;
//            name22.font = [UIFont boldSystemFontOfSize:20];
//            name22.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
//            [self.view addSubview:name22];
//            

            
            UILabel * htc = [[UILabel alloc]init];
            htc.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.95);
            htc.bounds = CGRectMake(0, 0, 650, 80);
            htc.text = @"程序员 何天从";
            htc.textAlignment = NSTextAlignmentCenter;
            htc.textColor = TCCoror(147, 147, 147);
            htc.font = [UIFont systemFontOfSize:18];
            [self.view addSubview:htc];
            
            
            UILabel * rights = [[UILabel alloc]init];
            rights.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.98);
            rights.bounds = CGRectMake(0, 0, 650, 80);
            rights.text = @"© 2014-2015 he tianchong All rights reserved";
            rights.textAlignment = NSTextAlignmentCenter;
            rights.textColor = TCCoror(147, 147, 147);
            rights.font = [UIFont systemFontOfSize:15];
            [self.view addSubview:rights];
            
            
            break;
        }
            
        case 1:
            

            
            break;
            
        case 2:
        {
            
            break;
        }
            
        case 3:
            
            
            break;
            
        case 4:
            
            break;
            
        case 5:
            
            
            break;
            
        case 6:
            
            
            break;
            
        default:
            break;
    }
    
}






//点击左上角箭头时，返回
-(void)backMove
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}




@end
