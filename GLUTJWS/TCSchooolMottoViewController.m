//
//  TCSchooolMottoViewController.m
//  GLUTJWsystem
//
//  Created by joonsheng on 14-8-25.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCSchooolMottoViewController.h"
#import "TCAboutGlutViewController.h"
#import "MBProgressHUD+MJ.h"

@interface TCSchooolMottoViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) UITableView * aboutGlutTable;
@property (nonatomic, weak) UIImageView * saoliIamge;
@property (nonatomic, weak) UIImageView * kebeIamge;

@end

@implementation TCSchooolMottoViewController




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
    
    

    UIImageView * motooV = [[UIImageView alloc ]initWithFrame:self.view.bounds];
    [self.view addSubview:motooV];
    
    
   //  UITextView * aboutGlut = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64)];

    
     UIScrollView * crollView =[[UIScrollView alloc ]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64)];
    
     UITableView * aboutGlutTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain ];
    aboutGlutTable.separatorColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    self.aboutGlutTable = aboutGlutTable;
    self.aboutGlutTable.delegate = self;
    self.aboutGlutTable.dataSource = self;
    
    
    switch (self.tag) {
        case 1:
            //全屏图片，隐藏状态栏
            [UIApplication sharedApplication].statusBarHidden = YES;
            motooV.image = [UIImage imageNamed:@"hode.png"];
            break;
            
        case 2:
            //全屏图片，隐藏状态栏
            [UIApplication sharedApplication].statusBarHidden = YES;
            motooV.image = [UIImage imageNamed:@"duxie.png"];
            break;
            
        case 3:
            //全屏图片，隐藏状态栏
            [UIApplication sharedApplication].statusBarHidden = YES;
            motooV.image = [UIImage imageNamed:@"weisi.png"];
            break;
            
        case 4:
            //全屏图片，隐藏状态栏
            [UIApplication sharedApplication].statusBarHidden = YES;
             motooV.image = [UIImage imageNamed:@"lixin.png"];
            break;
            
        case 5://校历
        {
            
            //设置图片
            //右栏
            UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [rbtn setFrame:CGRectMake(_navView.frame.size.width - 40, 20, 40, 40)];
            //[rbtn setTitle:@"右" forState:UIControlStateNormal];
            [rbtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
            rbtn.adjustsImageWhenHighlighted = NO;
            [rbtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
            [_navView addSubview:rbtn];
            
            
            /*读取入图片*/
            //Document
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
            NSString *saoliPath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"newSaoli.png"];
            
            //因为拿到的是个路径，所以把它加载成一个data对象
            NSData *data=[NSData dataWithContentsOfFile:saoliPath];
            
            UIImageView * saoliIamge = [[UIImageView alloc]init];
            
            //判断是否存储照片，如果没有就用默认
            if (data)
            {
                //把该图片读出来
                saoliIamge.image = [UIImage imageWithData:data];
                
            }
            else
            {
                saoliIamge.image = [UIImage imageNamed:@"saoli.png"];
            }
            
            crollView.tag = 1;
            crollView.minimumZoomScale = 0.1;
            crollView.maximumZoomScale = 3.0;
            crollView.zoomScale = 0.1;
            saoliIamge.frame = CGRectMake(5, 0, self.view.frame.size.width -10, self.view.frame.size.height -10);
            self.saoliIamge = saoliIamge;
            crollView.contentSize = self.view.frame.size;
            crollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            crollView.delegate = self;
            [crollView addSubview:self.saoliIamge];
            [self.view addSubview:crollView];
            
            break;
        }
        case 6://作息时间
        {
            crollView.tag = 2;
            crollView.minimumZoomScale = 0.1;
            crollView.maximumZoomScale = 3.0;
            UIImageView * kebeIamge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"kebe.png"]];
            kebeIamge.frame = CGRectMake(5, 0, self.view.frame.size.width -10, self.view.frame.size.height - 150);
            self.kebeIamge = kebeIamge;
            crollView.contentSize = self.kebeIamge.frame.size;
            crollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            crollView.delegate = self;
            [crollView addSubview:self.kebeIamge];
            
            [self.view addSubview:crollView];
            break;
        }
        case 7:
            
            [self.view addSubview:aboutGlutTable];
            break;
            
        default:
            break;
    }
    
}





//判断那个图片在缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{

    if (scrollView.tag == 1) {
        return self.saoliIamge;
    }
    else
    {
        return self.kebeIamge;
    }

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

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"aboutID";
    
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
        
        cell.textLabel.text = @"桂林理工大学";
        
        
    }
    else if([indexPath row] == 1)
    {
    
        cell.textLabel.text = @"桂林理工大学校歌";
    
    
    }
    else if([indexPath row] == 2)
    {
        cell.textLabel.text = @"桂林理工大学计算机协会";
        
        
    }
    else if([indexPath row] == 3)
    {
        cell.textLabel.text = @"更多内容，敬请期待~~";
        
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
        
        TCAboutGlutViewController * aboutViewController = [[TCAboutGlutViewController alloc]initWithFrame:self.view.bounds andTitle:@"桂林理工大学" andTag:0];
        [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:aboutViewController];
        
    }
    else if([indexPath row] == 1)
    {
        
        TCAboutGlutViewController * aboutViewController = [[TCAboutGlutViewController alloc]initWithFrame:self.view.bounds andTitle:@"校歌" andTag:1];
        [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:aboutViewController];
        
        
    }
    else if([indexPath row] == 2)
    {
        TCAboutGlutViewController * aboutViewController = [[TCAboutGlutViewController alloc]initWithFrame:self.view.bounds andTitle:@"桂林理工大学计算机协会" andTag:2];
        [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:aboutViewController];
        
    }
    else if([indexPath row] == 3)
    {
        //[MBProgressHUD showMessage:@"更多详细信息，请期待~~"];
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


- (void)rightAction
{
    
    UIActionSheet * sheets = [[UIActionSheet alloc]initWithTitle:@"选择校历" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择",@"默认校历", nil];
    sheets.tag = 1;
    sheets.actionSheetStyle = UIActionSheetStyleDefault;
    
    [sheets showInView:self.view];
    
}



//处理Sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //点击了头像
    if (actionSheet.tag == 1 && buttonIndex == 0)
    {
        //拍照
        UIImagePickerController * camera = [[UIImagePickerController alloc]init];
        
        camera.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        camera.delegate = self;
        
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
             [self presentViewController:camera animated:YES completion:nil];
        });
        
    }
    else if(actionSheet.tag == 1 && buttonIndex == 1)
    {
        //从相册
        UIImagePickerController * photo = [[UIImagePickerController alloc]init];
        
        photo.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        photo.delegate = self;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self presentViewController:photo animated:YES completion:nil];
        });
        
    }
    else if(actionSheet.tag == 1 && buttonIndex == 2)
    {
        //默认头像
        UIImage * image  = [UIImage imageNamed:@"saoli.png"];
        
        //存储头像图片
        //Document
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        
        /*写入图片*/
        NSString *saoliPath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"newSaoli.png"];
        //将图片写到Documents文件中
        [UIImagePNGRepresentation(image) writeToFile:saoliPath atomically:YES];
        
        self.saoliIamge.image = image;
        
    }
}


//处理头像
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    
    //存储头像图片
    //Document
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    /*写入图片*/
    //帮文件起个名
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"newSaoli.png"];
    //将图片写到Documents文件中
    [UIImagePNGRepresentation(image) writeToFile:uniquePath atomically:YES];
    
    self.saoliIamge.image = image;
    
}


@end