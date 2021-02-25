//
//  TDButton.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLButton : UIButton
{
@private UIColor *mHighlightedColor;
}

-(void)setHighlightedColor:(UIColor *)color;

@end
