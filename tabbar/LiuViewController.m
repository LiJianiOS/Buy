//
//  LiuViewController.m
//  tabBar
//
//  Created by Oreal51 on 16/3/7.
//  Copyright © 2016年 1808. All rights reserved.
//

#import "LiuViewController.h"

@interface LiuViewController ()

@end

@implementation LiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    lab.text = @"zengying";
    [self.view addSubview:lab];
    // Do any additional setup after loading the view from its nib.
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
