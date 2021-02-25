//
//  GamePad.m
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 09.01.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "GamePad.h"
#import "Consts.h"

@implementation GamePad

#pragma mark - Ctors/Dctor
-(GamePad *)initWithParentView:(UIView *)view
{
    self = [super initWithParentView:view];
    if (self)
    {
        [self setBaseColor:CONSTS_COLOR_DEFAULT_TRANSPARENT];
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
}

@end
