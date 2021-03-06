//
//  AppDelegate.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/9/29.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:self.window.bounds];
    
    ViewController *VC = [[ViewController alloc]init];
    VC.view.backgroundColor = [UIColor whiteColor];
    //创建并设置根视图
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
    //设置导航栏的颜色
    [[UINavigationBar appearance]setBarTintColor:[UIColor purpleColor]];
    //这个方法也可以设置导航栏的颜色
//    [nav.navigationBar setBarTintColor:[UIColor redColor]];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
