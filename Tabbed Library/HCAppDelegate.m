//
//  HCAppDelegate.m
//  Tabbed Library
//
//  Created by Franco Cedillo on 5/26/13.
//  Copyright (c) 2013 HartasCuerdas. All rights reserved.
//

#import "HCAppDelegate.h"
#import "HCPiratesViewController.h"
#import "HCAllSwordsViewController.h"

@implementation HCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize Tab Bar Controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // Initialize Pirates View Controller
    HCPiratesViewController *piratesViewController = [[HCPiratesViewController alloc] init];
    // Initialize Navigation Controller
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:piratesViewController];
    // Initialize All Swords View Controller
    HCAllSwordsViewController *allSwordsViewController = [[HCAllSwordsViewController alloc] init ];
    // Initialize All Swords View Controller
    HCAllSwordsViewController *vc3 = [[HCAllSwordsViewController alloc] init ];
    HCAllSwordsViewController *vc4 = [[HCAllSwordsViewController alloc] init ];
    HCAllSwordsViewController *vc5 = [[HCAllSwordsViewController alloc] init ];
    HCAllSwordsViewController *vc6 = [[HCAllSwordsViewController alloc] init ];
    // Set View Controllers Tab Bar Controller
    [tabBarController setViewControllers:@[navigationController, allSwordsViewController, vc3, vc4, vc5, vc6]];
    // Initialize Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Configure Window
    [self.window setRootViewController:tabBarController];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
