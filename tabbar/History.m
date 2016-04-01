//
//  History.m
//  tabBar
//
//  Created by 1808 on 15/11/27.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "History.h"

@interface History ()

@end

@implementation History

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 200, 200)];
    lb.text = @"历史";
    [self.view addSubview:lb];
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
