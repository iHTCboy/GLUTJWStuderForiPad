//
//  TCAboutGlutViewController.h
//  GLUTJWS
//
//  Created by HTC on 14-10-11.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCAboutGlutViewController : UIViewController

@property (nonatomic, copy)NSString * mottoTitle;
@property (nonatomic, assign)NSInteger tag;


- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)mottoTitle andTag:(NSInteger)tag;

@end
