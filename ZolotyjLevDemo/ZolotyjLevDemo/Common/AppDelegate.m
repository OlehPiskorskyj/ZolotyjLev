//
//  AppDelegate.m
//  ZolotyjLevDemo
//
//  Created by Oleh Piskorskyj on 22.07.18.
//  Copyright © 2018 MetallicRain. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"

@implementation AppDelegate

@synthesize window = mWindow;
@synthesize navigationController = mNavigationController;

-(void)dealloc
{
    [mWindow release];
    [mNavigationController release];
    [super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setWindow:window];
    [window release];
    
    mNavigationController = [[ZLNavigationController alloc] init];
    
    [mWindow setRootViewController:mNavigationController];
    [mWindow makeKeyAndVisible];
    
    mMainView = [[MainView alloc] init];
    [mNavigationController pushViewController:mMainView animated:FALSE];
    [mMainView release];
    
    return TRUE;
}

-(void)applicationWillResignActive:(UIApplication *)application
{
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
}

-(void)applicationDidBecomeActive:(UIApplication *)application
{
}

-(void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark - Public
-(MainView *)mainView
{
    return mMainView;
}

@end
