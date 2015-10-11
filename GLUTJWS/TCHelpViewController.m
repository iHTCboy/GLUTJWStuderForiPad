//
//  TCHelpViewController.m
//  GLUTJWsystem
//
//  Created by joonsheng on 14-8-25.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCHelpViewController.h"

@interface TCHelpViewController ()

@end

@implementation TCHelpViewController
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
    [titleLabel setText:@"帮助"];
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
    
    
    UITextView * helps = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64)];
    
    helps.text = @"▶︎帮助1: 头像无法显示？\n       如果您的头像无法显示，请点击一下头像，系统会自动重新加载(由于没有获得学校接口，可能下载不稳定，或者手机网络信号不好，都会导致头像无显示）。至于自定义头像，大家期待下一个版本更新啊！\n\n▶︎帮助2: 为什么教务系统还是网页显示？\n       由于没有跟学校联系取得服务器API，所以目前学生信息的显示都是解释网页内容获取的，期待网页高手加盟，或与学校联系，取得API是目前解决用户体验的最好方法。大家还要耐心期待哦！\n\n▶︎帮助3: 登陆界面中,4/4s键盘可能被挡？\n       目前已经在键盘左上方提供“隐藏”按钮，同时，点击文本框外的界面，也可以隐藏键盘。屏幕文本框自适应键盘下一个版本考虑加入。\n\n▶︎问题4: 验证码显示不出来怎么办？\n       点击验证码图片可以刷新验证码，所以当验证码无法显示时，可以点击验证码位置，刷新验证码。如果还是显示不出来，那么可以完成退出软件后，在尝试登陆，如果还是不行，那么可以是服务器问题，请您稍后在尝试。\n\n▶︎帮助5: 点击我的课表时，为什么会卡?\n       还是那个原因，因为没有取得学校服务器的后台课表的url，而且由于每个班级的课表的url也不一样，所以第一次点击时会卡，是因为要解释网页获取对应的url，目前优化方法，就是点击一次之后，课表的url会存储下来，下次点击时，不用在解释url，就不会卡了，比如第一次登陆卡，也是获取学生信息时，解释要用大量cpu和内存，所以卡，解决方法都是，登陆一次，就把信息存储下来，下次就不在解释。目前，只能这样。\n\n▶︎帮助6: 您还有其它问题？(意见or反馈)\n       请联系作者（ihetiancong@qq.com）\n       非常欢迎大家，有任何关于本软件的意见或反馈，都可以发邮件给我！\n \n\n       ▶︎如果您非常熟悉网页或服务器，或熟练UI设计，都可以与我联系，让我们一起来共同开发！创造美好的桂工！\n       【本软件完全免费使用，没有任何开发收入，只能利用个人休息时间来开发，所以不能保证所有问题都能及时更新，望您理解和见谅！】\n\n       ▶︎感谢您使用桂林理工大学学生教务在线，本软件直接与学校服务器连接，不经过任何第三方系统连接，所以为了保护你的学生信息不被他人盗取，请在App Store下载本软件。否则，由此产生的一切后果只能由您自己承担，与本软件开发者无关。一切解释权归：程序猿哥哥所有！";
   
    helps.font = [UIFont systemFontOfSize:20];
    helps.editable = NO;
    [self.view addSubview:helps];

}


-(void)backMove
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}



@end