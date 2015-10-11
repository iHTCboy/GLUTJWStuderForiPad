//
//  LeftViewController.m
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "LeftViewController.h"
#import "MainAppViewController.h"
#import "MBProgressHUD+MJ.h"


@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic)MainAppViewController * delegateView;

@end

@implementation LeftViewController

NSMutableArray * jwInfoList;
UITableView * listTable;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageBgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageBgV setImage:[UIImage imageNamed:@"sidebar_bg.jpg"]];
    [self.view addSubview:imageBgV];
    
    NSString * jwListPath = [[NSBundle mainBundle] pathForResource:@"jwInfoList.plist" ofType:nil];
    
    jwInfoList = [[NSMutableArray alloc] initWithContentsOfFile:jwListPath];
    

    self.delegateView = [[MainAppViewController alloc]init];
    
    UIView *listV = [[UIView alloc] initWithFrame:CGRectMake( -20, 40, self.view.frame.size.width * 0.8, self.view.frame.size.height - 40)];
    
    [listV setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:listV];
    
    listTable =[[UITableView alloc ]initWithFrame:listV.bounds style:UITableViewStylePlain];
    
    listTable.BackgroundColor = [UIColor clearColor];
    listTable.separatorColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    listTable.showsVerticalScrollIndicator = NO;
    //listTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //listTable.sectionHeaderHeight = 20;
    //listTable.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [listV addSubview:listTable];
    
    listTable.delegate = self;
    listTable.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return jwInfoList.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    NSInteger rowNow = [indexPath row];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text =[NSString stringWithFormat:@"      %@",jwInfoList[rowNow][0]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:28];
    //cell.textLabel.highlightedTextColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    //cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.selectedBackgroundView = [[UIView alloc]init];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    cell.separatorInset = UIEdgeInsetsMake(0, -20, 0, 160);
    
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger rowNow = indexPath.row;

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    //判断是否离线模式，如果不是，就加载对应的学生信息
if (![defaults boolForKey:@"switchLogout"])
{
    
    //当左边栏List被点击时，通知代理URL
    NSURL * jwURL = [NSURL URLWithString:jwInfoList[rowNow][1]];
    NSString * jwTitle = jwInfoList[rowNow][0];

    

    
    
    //判断，拼接我的课表的URL
    if (rowNow == 2 && ![defaults boolForKey:@"ismyClass"])
    {
        //获取我的课表的URL信息
        NSURL * url =[NSURL URLWithString:@"http://202.193.80.58:81/academic/student/currcourse/currcourse.jsdo?groupId=&moduleId=2000"];
        
        NSData * data = [NSData dataWithContentsOfURL:url];
        //gbk转UTF-8
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString * urlString = [[NSString alloc]initWithData:data encoding:gbkEncoding];
        
        NSString * middel = (NSString *) [[[[urlString componentsSeparatedByString:@"coursearrange"] objectAtIndex:1] componentsSeparatedByString:@"STUDENT"] objectAtIndex:0];
        
        
        NSString * clessURL = [[NSString alloc]initWithFormat:@"%@%@%@",jwInfoList[rowNow][1],middel,@"STUDENT&sectionType=COMBINE"];
    
        jwURL = [NSURL URLWithString:clessURL];
        
        [defaults setBool:YES forKey:@"ismyClass"];
        [defaults setValue:clessURL forKeyPath:@"myClass"];
        [defaults synchronize];
        
    }
    else if (rowNow == 2)
    {
        NSString  * urls = [defaults valueForKeyPath:@"myClass"];
        jwURL = [NSURL URLWithString:urls];
    
    }
    
    
    self.delegate =self.delegateView;
    [self.delegate leftListSelectDelegate:jwURL andTitle:(NSString *)jwTitle];
    
    
}
else
{
    //提示用户，当前为离线模式
    [MBProgressHUD showError:@"当前为离线模式"];

}
    

    
    //通知SliderView点击事件
    // NSString *myString = @"back";
   // [[NSNotificationCenter defaultCenter] postNotificationName: @"back" object:myString userInfo: nil];

    
}

@end
