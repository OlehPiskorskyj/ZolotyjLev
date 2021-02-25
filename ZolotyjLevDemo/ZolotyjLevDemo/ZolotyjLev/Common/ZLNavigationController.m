//
//  ZLNavigationController.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 29.07.13.
//  Copyright (c) 2013 MetallicRain. All rights reserved.
//

#import "ZLNavigationController.h"

@implementation ZLNavigationController

-(id)init
{
    self = [super init];
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

-(void)viewDidLoad
{
    self.navigationBarHidden = TRUE;
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
