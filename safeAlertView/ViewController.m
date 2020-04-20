//
//  ViewController.m
//  safeAlertView
//
//  Created by x d on 2020/4/20.
//  Copyright © 2020 lijie. All rights reserved.
//

#import "ViewController.h"
#import "SafeAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SafeAlertView *safeAlertView = [[SafeAlertView alloc]initWithFrame:self.view.frame];
    safeAlertView.alertTitle = @"安全提示";
//    safeAlertView.backgroundImage = [UIImage imageNamed:@"img_popwinz_arwarning"];
     safeAlertView.backgroundImage = @"img_popwinz_arwarning";
    [self.view addSubview:  safeAlertView];
    safeAlertView.closeAlertViewBlock = ^(int selected){
        if(selected == 1){
            NSLog(@"选择了不再弹出提示！");
        }
    };
    // Do any additional setup after loading the view.
}


@end
