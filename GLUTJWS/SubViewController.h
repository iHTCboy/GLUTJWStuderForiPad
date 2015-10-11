//
//  SubViewController.h
//  testMyBackNavigation
//
//  Created by chen on 14-3-25.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController

@property (nonatomic, strong) NSURL *jwURL;
@property (nonatomic,copy)NSString * navTitle;


- (id)initWithFrame:(CGRect)frame  andURL:(NSURL *)jwURL andTitle:(NSString *)navTitle;

@end