//
//  RightViewController.m
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "RightViewController.h"
#import "DXAlertView.h"
#import "TCLoginViewController.h"
#import "SliderViewController.h"
#import "TCInfomationViewController.h"
#import "TCHelpViewController.h"
#import "MBProgressHUD+MJ.h"

@interface RightViewController()

@property (nonatomic,retain) UIImageView *headImageView;
@property (nonatomic,strong) UILabel * numberLabel;
@property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UILabel * classLabel;
@property (nonatomic,strong) UILabel * collegeLabel;

@end

@implementation RightViewController
NSTimer * timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageBgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageBgV setImage:[UIImage imageNamed:@"sidebar_bg.jpg"]];
    [self.view addSubview:imageBgV];
    imageBgV.userInteractionEnabled = YES;
    
    float y = 0.12* self.view.frame.size.height;
    // 头像
    UIImageView * headImageView = [[UIImageView alloc] init];
    headImageView.backgroundColor = [UIColor clearColor];
    headImageView.frame = CGRectMake(self.view.center.x, y, 200, 200);
    headImageView.layer.cornerRadius = 100.0;
    headImageView.layer.borderWidth = 3.0;
    headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    headImageView.layer.masksToBounds = YES;
    self.headImageView = headImageView;
    [imageBgV addSubview: headImageView];
    
    
    //点击刷新头像
    headImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectHeadImage:)];
    [headImageView addGestureRecognizer:singleTap];
    
    
    
    //使用通知，加载头像和学号
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadHead:) name: @"reloadHead" object:nil];
    
    
    //学号？名字？
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y * 0.72, 200, 40)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:36];
    nameLabel.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel = nameLabel;
    [self.view addSubview: nameLabel];
    
    UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x , self.view.center.y * 0.82 , 200, 40)];
    numberLabel.backgroundColor = [UIColor clearColor];
    numberLabel.font = [UIFont boldSystemFontOfSize:23];
    numberLabel.textColor = [UIColor whiteColor];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel  =  numberLabel;
    [self.view addSubview: numberLabel];
    
    UILabel * classLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x  , self.view.center.y * 0.9, 200, 40)];
    classLabel.backgroundColor = [UIColor clearColor];
    classLabel.font = [UIFont boldSystemFontOfSize:23];
    classLabel.textColor = [UIColor whiteColor];
    classLabel.textAlignment = NSTextAlignmentCenter;
    self.classLabel = classLabel;
    [self.view addSubview: classLabel];
    
    UILabel * collegeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x  * 0.92, self.view.center.y * 0.98, 250, 40)];
    collegeLabel.backgroundColor = [UIColor clearColor];
    collegeLabel.font = [UIFont boldSystemFontOfSize:23];
    collegeLabel.textColor = [UIColor whiteColor];
    collegeLabel.textAlignment = NSTextAlignmentCenter;
    self.collegeLabel = collegeLabel;
    [self.view addSubview: collegeLabel];
    
    
    
    //取消按钮
    UIButton * cancel =[[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x * 0.93 , self.view.center.y * 5/3.8, 300, 55)];
    
    cancel.backgroundColor = [UIColor redColor];
    [cancel setTitle:@"退出当前账号" forState:UIControlStateNormal];
    cancel.titleLabel.textColor = [UIColor whiteColor];
    cancel.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    cancel.layer.cornerRadius = 6;
    cancel.layer.masksToBounds = YES;
    [cancel addTarget:self action:@selector(cancelAccount) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:cancel];
    
    
    
    //help
    UIButton * helpBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y * 7/3.8, 80, 25)];
    [helpBtn setImage:[UIImage imageNamed:@"help35.png"] forState:UIControlStateNormal];
    [helpBtn setTitle:@" 帮助" forState:UIControlStateNormal];
    [helpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    helpBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    helpBtn.adjustsImageWhenDisabled = NO;
    [helpBtn addTarget:self action:@selector(helpBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helpBtn];
    
    //infomation
    UIButton * infoBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x * 4.3/3, self.view.center.y * 7/3.8, 80, 25)];
    [infoBtn setImage:[UIImage imageNamed:@"info35.png"] forState:UIControlStateNormal];
    [infoBtn setTitle:@" 更多" forState:UIControlStateNormal];
    [infoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    infoBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    infoBtn.adjustsImageWhenDisabled = NO;
    [infoBtn addTarget:self action:@selector(infoBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoBtn];
 
    
    
    /*读取入图片*/
    //Document
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"image.png"];
    
    //因为拿到的是个路径，所以把它加载成一个data对象
    NSData *data=[NSData dataWithContentsOfFile:uniquePath];
    
    //判断是否存储照片，如果没有就用默认
    if (data)
    {
        //把该图片读出来
        headImageView.image = [UIImage imageWithData:data];
        
    }
    else
    {
        headImageView.image = [UIImage imageNamed:@"head1.jpg"];
    }

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    //如果有存储个人的信息，就读取个人信息
    if ([defaults valueForKeyPath:@"numberLabel"])
    {
        self.numberLabel.text = [defaults valueForKeyPath:@"numberLabel"];
        
        self.nameLabel.text = [defaults valueForKeyPath:@"nameLabel"];
        
        self.classLabel.text = [defaults valueForKeyPath:@"classLabel"];
        
        self.collegeLabel.text = [defaults valueForKeyPath:@"collegeLabel"];
            
    }
    
    
}


//帮助界面
-(void)helpBtn
{

    TCHelpViewController *helpViewController = [[TCHelpViewController alloc]init];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:helpViewController];

}
                                                                   
//关于界面
-(void)infoBtn
{
    TCInfomationViewController *infoViewController = [[TCInfomationViewController alloc]init];
    
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:infoViewController];

}


//加载右侧栏详细信息
-(void)reloadHead:(NSNotification *)note
{
    
    NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"roladHead"];
    [defaults synchronize];
   
   // TCLog(@"%@",note);
    
    self.numberLabel.text = note.object;
     [defaults setValue:self.numberLabel.text forKeyPath:@"numberLabel"];
     [defaults synchronize];
    
    //获取用户信息
   NSURL * url =[NSURL URLWithString:@"http://202.193.80.58:81/academic/showPersonalInfo.do"];
   NSData * data = [NSData dataWithContentsOfURL:url];
   NSString * urlString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //去掉所有换行
    NSString *strUrl1 = [urlString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //去掉所有空格
    NSString *strUrl2 = [strUrl1 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
  //  NSLog(@"return=%@",(NSString *) [[[[strUrl2 componentsSeparatedByString:@"所在院系</th><td>"] objectAtIndex:1] componentsSeparatedByString:@"&nbsp;"] objectAtIndex:0]);
    
    
    //获取名字
//    NSRange nameRange =[urlString rangeOfString:@"真实姓名</th>"];
//    nameRange.location =nameRange.location + nameRange.length + 9;
//    nameRange.length = nameRange.length -6;
//    NSString * nameTitle = [urlString substringWithRange:nameRange];
     self.nameLabel.text = (NSString *) [[[[strUrl2 componentsSeparatedByString:@"真实姓名</th><td>"] objectAtIndex:1] componentsSeparatedByString:@"&"] objectAtIndex:0];
    
    [defaults setValue:self.nameLabel.text forKeyPath:@"nameLabel"];
    [defaults synchronize];
    
    //获取班级
//    NSRange classRange =[urlString rangeOfString:@"班级</th>"];
//    classRange.location =classRange.location + classRange.length + 9;
//    classRange.length = classRange.length +2;
//    NSString * classTitle = [urlString substringWithRange:classRange];
     self.classLabel.text = (NSString *) [[[[strUrl2 componentsSeparatedByString:@"班级</th><td>"] objectAtIndex:1] componentsSeparatedByString:@"&"] objectAtIndex:0];
    
     [defaults setValue:self.classLabel.text forKeyPath:@"classLabel"];
     [defaults synchronize];
    
    //获取院系
//    NSRange collegeRange =[urlString rangeOfString:@"所在院系</th>"];
//    collegeRange.location =collegeRange.location + collegeRange.length + 9;
//    collegeRange.length = collegeRange.length;
//    NSString * collegeTitle = [urlString substringWithRange:collegeRange];
     self.collegeLabel.text = (NSString *) [[[[strUrl2 componentsSeparatedByString:@"所在院系</th><td>"] objectAtIndex:1] componentsSeparatedByString:@"&"] objectAtIndex:0];

    [defaults setValue:self.collegeLabel.text forKeyPath:@"collegeLabel"];
    [defaults synchronize];

    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 0 ,0)];
    [self.view addSubview:webView];
    
    NSURL *tourl = [NSURL URLWithString:@"http://202.193.80.58:81/academic/accessModule.do?moduleId=2060&groupId="];
    NSURLRequest *request = [NSURLRequest requestWithURL:tourl];
    [webView loadRequest:request];

    
    //定时器加载头像图片
    timer =[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(reloadhead) userInfo:nil repeats:NO];
    
}

//取消登录
-(void)cancelAccount
{
    DXAlertView * alert = [[DXAlertView alloc ]initWithTitle:@"提示" contentText:@"是否退出当前账号，返回登陆界面" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
    
    [alert show];
    
    alert.rightBlock = ^() {
        
       
        TCLoginViewController  * loginVC = [[TCLoginViewController alloc]init];
        
        self.view.window.rootViewController = loginVC;
       // [UIApplication sharedApplication].keyWindow.rootViewController = loginVC;
        
        //重新登陆时，改变数据
        NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
        //退出帐号后，在次登陆，会重新加载个人信息
        [defaults setBool:NO forKey:@"roladHead"];
        //退出帐号后，在次登陆，点击“我的课表”，会重新拼接URL
        [defaults setBool:NO forKey:@"ismyClass"];
        [defaults synchronize];
        
        
        
        //通知SliderView关闭右侧栏事件
        NSString *myHome = @"backHome";
        [[NSNotificationCenter defaultCenter] postNotificationName: @"backHome" object:myHome userInfo: nil];

    };

}

//加载头像
-(void)reloadhead
{
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 0 ,0)];
    [self.view addSubview:webView];
    NSURL *tourl = [NSURL URLWithString:@"http://202.193.80.58:81/academic/accessModule.do?moduleId=2060&groupId="];
    NSURLRequest *request = [NSURLRequest requestWithURL:tourl];
    [webView loadRequest:request];
    
    NSURL *url = [NSURL URLWithString:@"http://202.193.80.58:81/academic/manager/studentinfo/showStudentImage.jsp"];
    
    NSData * imageDate = [NSData dataWithContentsOfURL:url];
    
    UIImage * newImage = [UIImage  imageWithData:imageDate];
    
    self.headImageView.image = newImage;
    
       //存储头像图片
       //Document
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    
    /*写入图片*/
    //帮文件起个名
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"image.png"];
    //将图片写到Documents文件中
    [UIImagePNGRepresentation(newImage)writeToFile: uniquePath atomically:YES];
    

}


//点击头像时，自动重新加载头像
-(void)selectHeadImage:(UIImageView *)headImage
{
   
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //判断是否离线模式，如果不是，就加载头像
    if (![defaults boolForKey:@"switchLogout"])
    {
        //[self reloadhead];
    [self performSelector:@selector(reloadhead) withObject:self afterDelay:1];
        //[self performSelectorInBackground:@selector(reloadhead) withObject:nil];
        
    }
    else
    {    //提示用户，当前为离线模式
        [MBProgressHUD showError:@"当前为离线模式"];
        
    }
    
    
 
}


@end
