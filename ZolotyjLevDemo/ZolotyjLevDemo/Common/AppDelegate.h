//
//  AppDelegate.h
//  ZolotyjLevDemo
//
//  Created by Oleh Piskorskyj on 22.07.18.
//  Copyright © 2018 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
@private MainView *mMainView;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ZLNavigationController *navigationController;

-(MainView *)mainView;

@end
