//
//  TDButton.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLButton.h"

@implementation ZLButton

#pragma mark - Ctors/Dtor
-(void)dealloc
{
    if (mHighlightedColor) [mHighlightedColor release];
    [super dealloc];
}

#pragma mark - Override methods
-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted)
        [self setBackgroundColor:mHighlightedColor ?: [UIColor colorWithWhite:1.0f alpha:0.5f]];
    else
        [self setBackgroundColor:[UIColor clearColor]];
}

#pragma mark - Public methods
-(void)setHighlightedColor:(UIColor *)color
{
    if (mHighlightedColor != color)
    {
        if (mHighlightedColor)
            [mHighlightedColor release];
        [color retain];
        mHighlightedColor = color;
    }
}

@end
