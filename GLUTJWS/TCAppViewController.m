//
//  TCAppViewController.m
//  GLUTJWS
//
//  Created by HTC on 14-10-11.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCAppViewController.h"
#import "MBProgressHUD+MJ.h"
#import <MessageUI/MessageUI.h>

@interface TCAppViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) UITableView * moreAppTable;

@end

@implementation TCAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏属性
    UIView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
    ((UIImageView *)_navView).backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    
    //导航栏属性(红色）
//    UIImageView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
//    ((UIImageView *)_navView).backgroundColor = TCCoror(159,5,13);
//    [self.view addSubview:_navView];
//    _navView.userInteractionEnabled = YES;
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.frame.size.width - 200)/2, (_navView.frame.size.height - 20)/2, 200, 40)];
    [titleLabel setText:@"应用推荐"];
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
    

    
    UITableView * aboutAppTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain ];
    aboutAppTable.separatorColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    aboutAppTable.separatorStyle = UITableViewCellSelectionStyleNone;
    self.moreAppTable = aboutAppTable;
    self.moreAppTable.delegate = self;
    self.moreAppTable.dataSource = self;
    
    [self.view addSubview:aboutAppTable];
    
}


//点击左上角箭头时，返回
-(void)backMove
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"aboutID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //字体大小
    cell.textLabel.font = [UIFont boldSystemFontOfSize:25];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    
    //cell被选中的颜色
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];

    //imageView
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.layer.masksToBounds = YES;
    
    
    if ([indexPath section] == 0)
    {
        //右侧的指示
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"桂林理工大学";
        cell.detailTextLabel.text = @"教师HD版:课表、教务、校历、作息时间等查看，方便教师通过iPad，快速的登陆教务系统，了解教学的相关事务。";
        cell.imageView.image = [UIImage imageNamed:@"JWTlogomini.png"];
        
        
//        //右侧的指示
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.text = @"桂林理工大学";
//        cell.detailTextLabel.text = @"学生版:教务、校历、时间...";
//        cell.imageView.image = [UIImage imageNamed:@"JWslogomini.png"];
        
        
    }
    else if([indexPath section] == 1)
    {
        //右侧的指示
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"密记";
        cell.detailTextLabel.text = @"与众不同的记录方式！专注于打造简单，简洁的生活小密记，帮你记列表，记事项，写密记，个人心情的日记，备忘录等";
        cell.imageView.image = [UIImage imageNamed:@"snlogo180.png"];
        
        
    }
    else if([indexPath section] == 2)
    {
        //右侧的指示
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"桂林理工云图";
        cell.detailTextLabel.text = @"应用基于桂林理工大学雁山校区，自建的地点数据而成云图。集成雁山校区主要地点，云图准又细！";
        cell.imageView.image = [UIImage imageNamed:@"gluatCloudicom300.png"];
     
    }
    else if([indexPath section] == 3)
    {
        
        
    }
    
    
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([indexPath section] == 0)
    {
        
        UIActionSheet * sheets = [[UIActionSheet alloc]initWithTitle:@"桂林理工大学教务在线——教师iOSHD版" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从AppStore下载",@"短信告诉好友",@"邮件告诉好友", nil];
        
        //UIActionSheet * sheets = [[UIActionSheet alloc]initWithTitle:@"桂林理工大学教务在线——学生iOS版" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从AppStore下载",@"短信告诉好友",@"邮件告诉好友", nil];
        
        sheets.actionSheetStyle = UIActionSheetStyleAutomatic;
        
        //帮定tag
        sheets.tag = 1;
        
        [sheets showInView:self.view];
        
    }
    else if([indexPath section] == 1)
    {
        UIActionSheet * sheets = [[UIActionSheet alloc]initWithTitle:@"密记-与众不同的记录方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从AppStore下载",@"短信告诉好友",@"邮件告诉好友", nil];
        
        sheets.actionSheetStyle = UIActionSheetStyleAutomatic;
        
        //帮定tag
        sheets.tag = 2;
        
        [sheets showInView:self.view];
    
    }
    else if([indexPath section] == 2)
    {
        UIActionSheet * sheets = [[UIActionSheet alloc]initWithTitle:@"桂林理工大学云图——云就在“途”上" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从AppStore下载",@"短信告诉好友",@"邮件告诉好友", nil];
        
        sheets.actionSheetStyle = UIActionSheetStyleAutomatic;
        
        //帮定tag
        sheets.tag = 3;
        
        [sheets showInView:self.view];
    }
    else if([indexPath section] == 3)
    {

    }
    
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    if (section % 100 == 2)
    {
        return 15;
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;

}



//处理Sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 1)
    {
        //教师版
        [self downTJwWithactionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
        
        //学生版
        //[self downSJwWithactionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
        
    }
    else if(actionSheet.tag == 2)
    {
       //密记-与众不同的记录方式
       [self downSNoteWithactionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
    else if(actionSheet.tag == 3)
    {
       //桂林理工大学云图——云就在“途”上！
       [self downCloudWithactionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
}


//教师版推荐下载方法
-(void)downTJwWithactionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //下载
        [self openAppStoreWithID:@"945677727"];
        
        
    }
    else if(buttonIndex == 1)
    {
        //短信
        [self sendMessageWithBody:@"老师，您好，推荐你使用这款应用，这是桂林理工大学教务在线---教师iOS客户端，主要是教师登陆，可以查看校历、作息时间，最重要的是教师教学管理，方便教师通过手机，快速的登陆教务系统，了解教学的相关事务。您也快来下载试试用啊！\nAppStore下载: https://appsto.re/cn/cMzG2.i"];
    }
    else if(buttonIndex == 2)
    {
        //邮件
        [self sendEmeilTitle:@"老师，您快来下载这款应用试试啊！" withBody:@"老师，您好，推荐你使用这款应用，这是桂林理工大学教务在线---教师iOS客户端，主要是教师登陆，可以查看校历、作息时间，最重要的是教师教学管理，方便教师通过手机，快速的登陆教务系统，了解教学的相关事务。您也快来下载试试用啊！\n1、界面简洁，便捷\n2、记住密码，登陆方便\n3、离线模式，为您省流量\nAppStore下载: https://appsto.re/cn/cMzG2.i "];
        
    }
    
}


//学生版推荐下载方法
-(void)downSJwWithactionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        //下载
        [self openAppStoreWithID:@"914453383"];
        
        
    }
    else if(buttonIndex == 1)
    {
        //短信
        [self sendMessageWithBody:@"童鞋，推荐你使用这款应用，这是桂林理工大学教务在线---学生iOS客户端，主要是学生登陆，可以查看校历、作息时间，最重要的是学生教学管理，方便学生通过手机，快速的登陆教务系统，了解教学的相关事务。您也快来下载啊！\nAppStore下载: https://appsto.re/cn/hoxG2.i"];
    }
    else if(buttonIndex == 2)
    {
        //邮件
        [self sendEmeilTitle:@"童鞋，快来下载这款应用啊！" withBody:@"童鞋，推荐你使用这款应用，这是桂林理工大学教务在线---学生iOS客户端，主要是学生登陆，可以查看校历、作息时间，最重要的是学生教学管理，方便学生通过手机，快速的登陆教务系统，了解教学的相关事务。您也快来下载啊！\nAppStore下载: https://appsto.re/cn/hoxG2.i "];
        
    }
    
    
}


//密记推荐下载方法   密记-与众不同的记录方式 https://appsto.re/cn/cwRi3.i
-(void)downSNoteWithactionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //下载
        [self openAppStoreWithID:@"925021570"];
        
        
    }
    else if(buttonIndex == 1)
    {
        //短信
        [self sendMessageWithBody:@"我最近在使用密记，这款应用专注于打造最简单，最简洁，最简明，最简便的生活小密记，帮你记列表，记事项，写密记，个人心情的日记，备忘录等。你也快来试试吧!\nAppStore下载: https://appsto.re/cn/cwRi3.i"];
    }
    else if(buttonIndex == 2)
    {
        //邮件
        [self sendEmeilTitle:@"快来试用这款密记应用啊！" withBody:@"我最近在使用密记，这款应用专注于打造最简单，最简洁，最简明，最简便的生活小密记，帮你记列表，记事项，写密记，个人心情的日记，备忘录等。你也快来试试吧!\nAppStore下载: https://appsto.re/cn/cwRi3.i"];
        
    }
   
    
}



//云图 推荐下载方法   桂林理工大学云图——云就在“途”上！ 作者是 he tiancong https://appsto.re/cn/b0L44.i
-(void)downCloudWithactionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        //下载
        [self openAppStoreWithID:@"954359041"];
        
        
    }
    else if(buttonIndex == 1)
    {
        //短信
        [self sendMessageWithBody:@"我最近在使用桂林理工大学云图,应用是基于桂林理工大学雁山校区，自建的地点数据而成云图。\n1、集成雁山校区主要地点，云图准又细！\n2、大家都可以添加地点，云图大又多！\n3、让你在桂林生活旅游无阻碍，云图说到又做到！\nAppStore下载: https://appsto.re/cn/b0L44.i"];
    }
    else if(buttonIndex == 2)
    {
        //邮件
        [self sendEmeilTitle:@"快来试用这款桂林理工大学云图应用啊！" withBody:@"我最近在使用桂林理工大学云图,应用是基于桂林理工大学雁山校区，自建的地点数据而成云图。\n1、集成雁山校区主要地点，云图准又细！\n2、大家都可以添加地点，云图大又多！\n3、让你在桂林生活旅游无阻碍，云图说到又做到！\nAppStore下载: https://appsto.re/cn/b0L44.i"];
        
    }
}


#pragma mark - send 通用方法

-(void)openAppStoreWithID:(NSString *)ID
{
    //评分 无法使用
    //NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",ID];
    NSString *str = [NSString stringWithFormat: @"https://itunes.apple.com/cn/app/gui-lin-li-gong-da-xue-yun/id%@?mt=8", ID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}

-(void)sendMessageWithBody:(NSString *)body
{
    
    //短信
    //发短信
    MFMessageComposeViewController *mess = [[MFMessageComposeViewController alloc] init];
    
    // 设置短信内容
    mess.body = body;
    
    // 设置收件人列表
    //mess.recipients = @[@"joonsheng.htc@icloud.com"];
    
    // 设置代理
    mess.messageComposeDelegate = self;
    
    // 显示控制器
    [self presentViewController:mess animated:YES completion:nil];
    
    
}


-(void)sendEmeilTitle:(NSString *)title withBody:(NSString *)body
{
    
    //邮件
    // 不能发邮件
    //if (![MFMailComposeViewController canSendMail]) return;
    
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    // 设置邮件主题
    [mail setSubject:title];
    // 设置邮件内容
    [mail setMessageBody:body isHTML:NO];
    
    // 设置代理
    mail.mailComposeDelegate = self;
    // 显示控制器
    [self presentViewController:mail animated:YES completion:nil];
    
    
}



//处理短信
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    // 关闭短信界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
    {
        //NSLog(@"取消发送");
        [MBProgressHUD showSuccess:@"已取消发送"];
        
    }
    else if (result == MessageComposeResultSent)
    {
        //NSLog(@"已经发出");
        [MBProgressHUD showSuccess:@"发送成功"];
        
    } else
    {
        //NSLog(@"发送失败");
        [MBProgressHUD showError:@"发送失败"];
    }
    
    
    //定时器关闭提示
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(didhideHUD) userInfo:nil repeats:NO];
}



//处理邮件
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // 关闭邮件界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultCancelled)
    {
        [MBRoundProgressView setAnimationDelay:1];
        //NSLog(@"取消发送");
        [MBProgressHUD showSuccess:@"已取消发送"];
        
    } else if (result == MFMailComposeResultSent)
    {
        //NSLog(@"已经发出");
        [MBProgressHUD showSuccess:@"发送成功"];
        
    } else
    {
        //NSLog(@"发送失败");
        [MBProgressHUD showError:@"发送失败"];
    }
    
    //定时器关闭提示
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(didhideHUD) userInfo:nil repeats:NO];
}


//隐藏提示框
-(void)didhideHUD
{
    
    [MBProgressHUD hideHUD];
    
}

@end
