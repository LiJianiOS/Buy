//
//  remaiViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/22.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "remaiViewController.h"

@interface remaiViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *personTableView;
    UITableView *lineTableView;
    NSArray *dataSource;
    NSArray *lineSource;
    NSMutableArray *imageArray;
}
@end

@implementation remaiViewController
#define SCREEN_WIDTH 375
#define SCREEN_HEIGHT 618
- (void)viewDidLoad {
    [super viewDidLoad];
    imageArray = [NSMutableArray array];
    for (int i = 1; i <= 3; i++) {
        [imageArray addObject:[NSString stringWithFormat:@"%d.png",i]];
    }
    personTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 0, SCREEN_WIDTH/2+80, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    personTableView.delegate = self;
    personTableView.dataSource = self;
    personTableView.showsVerticalScrollIndicator = YES;//显示右侧滑栏
    personTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线
    [self.view addSubview:personTableView];
    
    lineTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH/2-80, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    lineTableView.dataSource = self;
    lineTableView.delegate = self;
    lineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:lineTableView];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    return nil;
}
#pragma mark tableViewDelegate
//有多少个组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == personTableView) {
        return 1;
    }else if (tableView == lineTableView) {
        return 1;
    }else {
        return 0;
    }
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if(tableView == lineTableView){
        return 10;
    }else
    {
        return 10;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==lineTableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    }
}

//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

//每个分组下边预留的空白高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(tableView == lineTableView){
    return 80;
    }else{
        return 65;
    }
}

//设置每行对应的cell（展示的内容）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(tableView ==personTableView)
    {
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 50, 50)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row]];
        [cell.contentView addSubview:imageView];
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, -10, 100, 60)];
        nameLabel.text = @"商品名称";
        [cell.contentView addSubview:nameLabel];
        UILabel *lb1=[[UILabel alloc]initWithFrame:CGRectMake(180, 40, 70, 20)];
        lb1.text = @"单价：40 /袋";
        lb1.font =[UIFont fontWithName:@"Arial" size:10];
        [cell.contentView addSubview:lb1];
        UILabel *Label=[[UILabel alloc]initWithFrame:CGRectMake(70, 20, 100, 60)];
        Label.text = @"商品简介";
        Label.font = [UIFont fontWithName:@"Arial" size:15];
//        label.font = [UIFont fontWithName:@"STHeiti-Medium.ttc" size:10];
        [cell.contentView addSubview:Label];
        return cell;
    }else {
        static NSString *identifer=@"linecell";
        UITableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell1==nil) {
        cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 0, 2, 80)];
    view.backgroundColor = [UIColor grayColor];
    [cell1.contentView addSubview:view];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(-5, 40, 10, 10)];
    button.backgroundColor = [UIColor brownColor];
    button.layer.cornerRadius = 5;
    [view addSubview:button];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 45, 30, 1)];
    view1.backgroundColor = [UIColor brownColor];
    [cell1.contentView addSubview:view1];
    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(50, 34, 50, 25)];
    bt.layer.cornerRadius = 5;
    bt.layer.borderWidth = 1;
    bt.layer.borderColor = [[UIColor blackColor]CGColor];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(2, -10, 50, 50)];
    lb.text = @"分类";
    [bt addSubview:lb];
    [cell1.contentView addSubview:bt];
    return cell1;
   }
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
