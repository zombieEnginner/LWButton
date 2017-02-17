//
//  ViewController.m
//  LWButton
//
//  Created by bhczmacmini on 17/2/17.
//  Copyright © 2017年 LW. All rights reserved.
//

#import "ViewController.h"
#import "LWButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //给定类型设置图片文字位置 红点显示
    LWButton *btn1 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleTop withFrame:CGRectMake(10, 74, 60, 60)];
    [btn1 setTitle:@"图片在上" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn1 showBadge];
    [self.view addSubview:btn1];
    
    LWButton *btn2 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleBottom withFrame:CGRectMake(80, 74, 60, 60)];
    [btn2 setTitle:@"图片在下" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn2 showBadge];
    [self.view addSubview:btn2];
    
    LWButton *btn3 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleLeft withFrame:CGRectMake(150, 74, 90, 60)];
    [btn3 setTitle:@"图片在左" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn3 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn3 showBadge];
    [self.view addSubview:btn3];
    
    LWButton *btn4 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleRight withFrame:CGRectMake(250, 74, 100, 60)];
    [btn4 setTitle:@"图片在右" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn4 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn4 showBadge];
    [self.view addSubview:btn4];
    
    LWButton *btn5 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleText withFrame:CGRectMake(10, 140, 60, 40)];
    [btn5 setTitle:@"文字" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn5 showBadge];
    [self.view addSubview:btn5];
    
    LWButton *btn6 = [[LWButton alloc] initWithAlignmentStyle:LWAlignmentStyleImage withFrame:CGRectMake(80, 140, 60, 60)];
    [btn6 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn6 showBadge];
    [self.view addSubview:btn6];
    
    //正常设置的
    LWButton *btn7 = [LWButton buttonWithType:UIButtonTypeCustom];
    btn7.frame = CGRectMake(150, 140, 40, 40);
    [btn7 setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    [btn7 showBadge];
    [self.view addSubview:btn7];
    
    LWButton *btn8 = [LWButton buttonWithType:UIButtonTypeCustom];
    btn8.frame = CGRectMake(190, 140, 50, 40);
    [btn8 setTitle:@"文字" forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn8.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn8 showBadge];
    [self.view addSubview:btn8];
    
    //倒计时
    LWButton *btn9 = [LWButton buttonWithType:UIButtonTypeCustom];
    btn9.frame = CGRectMake(250, 140, 80, 40);
    [btn9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn9 setTitle:@"获取验证码" forState:UIControlStateNormal];
    btn9.titleLabel.font = [UIFont systemFontOfSize:12];
    btn9.countdownTime = 40;//默认60
    btn9.countdownIngStr = @"获取中";//默认重新获取
    [btn9 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
//    [[btn9 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        [btn9 countdownStart];
//    }];
    [self.view addSubview:btn9];
}

- (void)btnclick:(LWButton *)sender
{
    [sender countdownStart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
