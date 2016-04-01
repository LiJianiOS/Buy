//
//  gouwucheViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/22.
//  Copyright (c) 2015年 1808. All rights reserved.
//
#import "DetailViewController.h"
#import "gouwucheViewController.h"
#define SCREEN_WIDTH 375
#define SCREEN_HEIGHT 618
@interface gouwucheViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *lineTableView;
@property (strong,nonatomic)NSMutableArray *gouData;
@end

@implementation gouwucheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _gouData =[ [NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    _lineTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _lineTableView.dataSource = self;
    _lineTableView.delegate = self;
    _lineTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_lineTableView];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark tableViewDelegate
//一个组里有多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_gouData count];
}


//每个分组下边预留的空白高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}
//

//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:NO];
    
}
//-(void)alertCreat{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"商品详情"message:@"商品详情具体介绍  ；；打开觉得好风景肌肤瞬间开阔的韩国 i" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:@"取消订单",nil];
//    [alert show];
//}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex cellForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    if (buttonIndex == 1) {
//        
////        ScanViewController *scan = [[ScanViewController alloc]init];
////        [self.navigationController pushViewController:scan animated:NO];
//    }

//}
//- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
//    
//}
//- (void)removeObjectAtIndex:(NSUInteger)index{
//    
//}
-  (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
//        NSLog(@"%d", _gouData.row);
        
        [self.gouData removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 90, 90)];
    imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row + 1]];
    [cell.contentView addSubview:imageView];
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, -10, 200, 60)];
    nameLabel.text = @"购单名字";
    [cell.contentView addSubview:nameLabel];
    UILabel *nameLabel1=[[UILabel alloc]initWithFrame:CGRectMake(200, 50, 200, 60)];
    nameLabel1.text = @"购单详情";
    [cell.contentView addSubview:nameLabel1];
//    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
