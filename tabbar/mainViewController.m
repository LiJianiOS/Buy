//
//  mainViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/19.
//  Copyright (c) 2015年 1808. All rights reserved.
//
#import "LiuViewController.h"
#import "mainViewController.h"
#import "ScanViewController.h"
#import "CollectionViewCell.h"
@interface mainViewController ()
@property (strong,nonatomic)NSMutableArray *baseDate;

@end

@implementation mainViewController


- (void)setRightBarButtonItem:(nullable UIBarButtonItem *)item animated:(BOOL)animated{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(scan)];
    //创建一个layout布局类
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc]init];
  
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(180, 200);
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    //代理设置
    collect.delegate=self;
    collect.dataSource=self;
    UINib *uinib = [UINib nibWithNibName:@"CollectionViewCell"bundle:nil];
    [collect registerNib:uinib forCellWithReuseIdentifier:@"cell"];
    //注册item类型 这里使用系统的类型   register注册
//    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
  
}

#pragma mark - UICollectionView
//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiuViewController *liuViewController = [[LiuViewController alloc]init];
    [self.navigationController pushViewController:liuViewController animated:YES];
}

#pragma 扫描
- (void)scan{
    
    ScanViewController *scan = [[ScanViewController alloc]init];
    [self.navigationController pushViewController:scan animated:NO];

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
