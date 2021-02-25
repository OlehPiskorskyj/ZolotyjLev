//
//  Brick.m
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 01.12.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "Brick.h"
#import "Consts.h"

@implementation Brick

#pragma mark Ctors/Dtor
-(Brick *)init
{
    self = [super init];
    if (self)
    {
        mTintColorIntensity = 0.0f;
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Override methods
-(void)initialize
{
    mScaleX = CONSTS_DIMENSION_BRICK_SCALE;
    mScaleY = CONSTS_DIMENSION_BRICK_SCALE;
    mScaleZ = CONSTS_DIMENSION_BRICK_SCALE;
    
    mRotationY = 1.0f;
    
    mIntersectionTargetRadius = mScaleX * CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_RADIUS;
    mIntersectionTargetCenterDeltaX = mScaleX * CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_X;
    mIntersectionTargetCenterDeltaY = mScaleY * CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_Y;
    mIntersectionTargetCenterDeltaZ = mScaleZ * CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_Z;
}

#pragma mark - Public methods
-(void)setTintColorIntensity:(float)intensity
{
    mTintColorIntensity = intensity;
}

-(float)tintColorIntensity
{
    return mTintColorIntensity;
}

@end
