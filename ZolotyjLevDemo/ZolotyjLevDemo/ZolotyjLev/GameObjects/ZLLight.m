//
//  ZLLight.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 14.07.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLLight.h"

@implementation ZLLight

#pragma mark Ctors/Dtor
-(ZLLight *)init
{
    self = [super init];
    if (self) [self initialize];
    return self;
}

-(void)initialize
{
    mPositionX = 0.0f;
    mPositionY = 0.0f;
    mPositionZ = 0.0f;
    
    mColorR = 1.0f;
    mColorG = 1.0f;
    mColorB = 1.0f;
    
    mAttenuation1 = 1.0f;
    mAttenuation2 = 0.0f;
    mAttenuation3 = 0.0f;
    
    mIntensivity = 1.0f;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Public methods
-(void)setPositionX:(float)x Y:(float)y Z:(float)z
{
    mPositionX = x;
    mPositionY = y;
    mPositionZ = z;
}

-(void)setColorR:(float)r G:(float)g B:(float)b
{
    mColorR = r;
    mColorG = g;
    mColorB = b;
}

-(void)setAttenuation1:(float)a1 A2:(float)a2 A3:(float)a3
{
    mAttenuation1 = a1;
    mAttenuation2 = a2;
    mAttenuation3 = a3;
}

-(void)setIntensivity:(float)intensivity
{
    mIntensivity = intensivity;
}

-(float)positionX
{
    return mPositionX;
}

-(float)positionY
{
    return mPositionY;
}

-(float)positionZ
{
    return mPositionZ;
}

-(float)colorR
{
    return mColorR;
}

-(float)colorG
{
    return mColorG;
}

-(float)colorB
{
    return mColorB;
}

-(float)attenuation1
{
    return mAttenuation1;
}

-(float)attenuation2
{
    return mAttenuation2;
}

-(float)attenuation3
{
    return mAttenuation3;
}

-(float)intensivity
{
    return mIntensivity;
}

#pragma mark - Other methods

@end
