//
//  AppDelegate.m
//  tabBar
//
//  Created by 1808 on 15/11/19.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "mainViewController.h"
#import "myViewController.h"
#import "gouwucheViewController.h"
#import "remaiViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tbc = [[UITabBarController alloc]init];//标签控制器
    tbc.tabBar.tintColor = [UIColor whiteColor];
    tbc.tabBar.barTintColor = [UIColor colorWithRed:154/255.0 green:37/255.021/255.0 blue:21/255.0  alpha:1];
    mainViewController *mainvc = [[mainViewController alloc]init];
    id obj1 =[self setTabBarInfoWithVC:mainvc imageName:@"shouye"title:@"首页"];
    
    gouwucheViewController *gouwuchevc = [[gouwucheViewController alloc]init];
    id obj2 =[self setTabBarInfoWithVC:gouwuchevc imageName:@"gouwuche" title:@"购物车"];
    remaiViewController *remaivc = [[remaiViewController alloc]init];
    id obj3 =[self setTabBarInfoWithVC:remaivc imageName:@"remai" title:@"热卖"];
    myViewController *myvc = [[myViewController alloc]init];
    id obj4 =[self setTabBarInfoWithVC:myvc imageName:@"wode" title:@"我的"];
    myvc.tabBarItem.badgeValue = @"20";
    myvc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d+",[myvc.tabBarItem.badgeValue intValue]+1];
    tbc.viewControllers=@[obj1,obj3,obj2,obj4];
    _window.rootViewController = tbc;
    [_window makeKeyAndVisible];
    

    return YES;
}

- (id)setTabBarInfoWithVC:(UIViewController *)vc imageName:(NSString *)imageName title:(NSString *)title
    {
        vc.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:imageName];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.navigationBar.barTintColor =[UIColor colorWithRed:154/255.0 green:37/255.021/255.0 blue:21/255.0  alpha:1];
        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:21]}];
        return nav;
    }

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
