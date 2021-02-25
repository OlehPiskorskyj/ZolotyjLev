//
//  Main.m
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 05.12.13.
//  Copyright (c) 2013 MetallicRain. All rights reserved.
//

#import "MainView.h"
#import "MainScene.h"

@implementation MainView

#pragma mark - Ctors/Dtor
-(MainView *)init
{
    self = [super initWithNibName:[ZLToolbox xibNameWithString:@"MainView"] bundle:NULL];
    return self;
}

-(void)dealloc
{
    [viewContainerGL release];
    [super dealloc];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    mMainScene = [[MainScene alloc] init];
    [mMainScene presentInView:viewContainerGL];
}

@end
