//
//  LeftViewController.h
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftViewController;

@protocol TCLeftListSelectDelegate <NSObject>
@optional

-(void)leftListSelectDelegate:(NSURL *)jwURL andTitle:(NSString *)jwTitle;

@end

@interface LeftViewController : UIViewController

@property (weak, nonatomic) id<TCLeftListSelectDelegate> delegate;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
@end
