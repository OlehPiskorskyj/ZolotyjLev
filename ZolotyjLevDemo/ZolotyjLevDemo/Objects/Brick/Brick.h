//
//  Brick.h
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 01.12.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLObject.h"

@interface Brick : ZLObject
{
@protected float mTintColorIntensity;
}

-(void)setTintColorIntensity:(float)intensity;
-(float)tintColorIntensity;

@end
