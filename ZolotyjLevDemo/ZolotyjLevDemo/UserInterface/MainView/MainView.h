//
//  Main.h
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 05.12.13.
//  Copyright (c) 2013 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScene.h"

@interface MainView : UIViewController
{
@private MainScene *mMainScene;
IBOutlet UIView *viewContainerGL;
}

-(MainView *)init;

@end
