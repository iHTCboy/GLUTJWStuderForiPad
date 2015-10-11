//
//  TCInfomationViewController.m
//  GLUTJWsystem
//
//  Created by joonsheng on 14-8-25.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCInfomationViewController.h"
#import "TCMoreInfoViewController.h"
#import "TCAppViewController.h"
#import "MBProgressHUD+MJ.h"
#import "TCShowNewViewController.h"

@interface TCInfomationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView * aboutInfoTable;



@end

@implementation TCInfomationViewController


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
    [titleLabel setText:@"更多"];
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
    

    
    
    UITableView * aboutGlutTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain ];
    aboutGlutTable.separatorColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    self.aboutInfoTable = aboutGlutTable;
    self.aboutInfoTable.delegate = self;
    self.aboutInfoTable.dataSource = self;
    
    [self.view addSubview:aboutGlutTable];
   
}




//点击左上角箭头时，返回
-(void)backMove
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"aboutInfoID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //字体大小
    cell.textLabel.font = [UIFont systemFontOfSize:35];
    //cell被选中的颜色
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    //右侧的指示
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    if ([indexPath row] == 0)
    {
        
        cell.textLabel.text = @"关于应用";
        
        
    }
    else if([indexPath row] == 1)
    {
        
        cell.textLabel.text = @"给我评分";
        
        
    }
    else if([indexPath row] == 2)
    {
        cell.textLabel.text = @"应用推荐";
    }
        else if([indexPath row] == 3)
        {
            cell.textLabel.text = @"更新导航";
        }
    else if([indexPath row] == 4)
    {
        cell.textLabel.text = @"更多，请期待~~";
    }
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([indexPath row] == 0)
    {
        
        TCMoreInfoViewController * aboutViewController = [[TCMoreInfoViewController alloc]initWithFrame:self.view.bounds andTitle:@"关于应用" andTag:0];
        [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:aboutViewController];
        
    }
    else if([indexPath row] == 1)
    {
        //下载
        [self openAppStoreWithID:@"944981563"];
    }
    else if([indexPath row] == 2)
    {
        
        
        TCAppViewController * aboutViewController = [[TCAppViewController alloc]init];
        [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:aboutViewController];
        
        
    }
    else if([indexPath row] == 3)
    {
            // 状态栏
            [UIApplication sharedApplication].statusBarHidden = YES;
            
            TCShowNewViewController * showVC  = [[TCShowNewViewController alloc]init];

            [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:showVC];
    }
    else if([indexPath row] == 4)
    {
        
        MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.labelText = @"敬请期待!";
        HUD.mode = MBProgressHUDModeText;
        
        [HUD showAnimated:YES whileExecutingBlock:^{
            
            sleep(1);
            
        } completionBlock:^{
            
            [HUD removeFromSuperview];
        }];
        
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

@end