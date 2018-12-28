//
//  SDTestCtrl.m
//  SDToolView
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SDTestCtrl.h"

@interface SDTestCtrl ()

@end

@implementation SDTestCtrl

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"label1";
    label1.textColor = [UIColor blackColor];
    label1.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight + 20, SCREEN_W, 40);
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"label2";
    label2.textColor = [UIColor grayColor];
    label2.frame = CGRectMake(0, CGRectGetMaxY(label1.frame) + 20, SCREEN_W, 40);
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"label3";
    label3.textColor = [UIColor darkGrayColor];
    label3.frame = CGRectMake(0, CGRectGetMaxY(label2.frame) + 20, SCREEN_W, 40);
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = @"label4";
    label4.textColor = [UIColor darkTextColor];
    label4.frame = CGRectMake(0, CGRectGetMaxY(label3.frame) + 20, SCREEN_W, 40);
    [self.view addSubview:label4];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(20, CGRectGetMaxY(label4.frame) + 20, SCREEN_W, 40);
    [button setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    [self.view addSubview:button];
}

- (void)buttonAction
{
    NSLog(@"button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
