//
//  TCSchooolMottoViewController.h
//  GLUTJWsystem
//
//  Created by joonsheng on 14-8-25.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCSchooolMottoViewController : UIViewController

@property (nonatomic, copy)NSString * mottoTitle;
@property (nonatomic, assign)NSInteger tag;


- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)mottoTitle andTag:(NSInteger)tag;

@end