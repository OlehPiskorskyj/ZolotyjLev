//
//  ZLCamera.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 30.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLCamera.h"

@implementation ZLCamera

#pragma mark - Singleton/Ctors/Dtor
+(ZLCamera *)instance
{
    static ZLCamera *sharedSingleton;
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[ZLCamera alloc] init];
        return sharedSingleton;
    }
}

-(id)init
{
    self = [super init];
    if (self)
    {
        mYawAngle = ZL_CONSTS_CAMERA_INITIAL_YAW_ANGLE;
        mPitchAngle = ZL_CONSTS_CAMERA_INITIAL_PITCH_ANGLE;
        [self updateLookAt];
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Public methods
-(GLKMatrix4 *)projection
{
    return &mProjection;
}

-(GLKVector3 *)position
{
    return &mPosition;
}

-(GLKMatrix4)view
{
    return GLKMatrix4MakeLookAt(mPosition.x, mPosition.y, mPosition.z, mPosition.x + mLookAt.x, mPosition.y + mLookAt.y, mPosition.z + mLookAt.z, 0.0f, 1.0f, 0.0f);
}

-(GLKVector3)raycast
{
    GLKVector4 clipCoords = GLKVector4Make(0.0f, 0.0f, -1.0f, 1.0f);
    GLKVector4 eyeCoords = [self eyeCoordsWithClipCoords:clipCoords];
    GLKVector3 worldRay = [self worldCoordsWithEyeCoords:eyeCoords];
    return worldRay;
}

-(void)setPositionWithX:(float)x Y:(float)y Z:(float)z
{
    mPosition.x = x;
    mPosition.y = y;
    mPosition.z = z;
}

-(float)positionX
{
    return mPosition.x;
}

-(float)positionY
{
    return mPosition.y;
}

-(float)positionZ
{
    return mPosition.z;
}

-(void)setYawAngle:(float)angle
{
    mYawAngle = angle;
    if (mYawAngle < 0.0f)
        mYawAngle += 2 * M_PI;
    if (mYawAngle > 2 * M_PI)
        mYawAngle -= 2 * M_PI;
    [self updateLookAt];
}

-(void)setPitchAngle:(float)angle
{
    mPitchAngle = angle;
    if (mPitchAngle < GLKMathDegreesToRadians(20.0f))
        mPitchAngle = GLKMathDegreesToRadians(20.0f);
    if (mPitchAngle > GLKMathDegreesToRadians(160.0f))
        mPitchAngle = GLKMathDegreesToRadians(160.0f);
    [self updateLookAt];
}

-(void)yawWithDelta:(double)delta
{
    [self setYawAngle:mYawAngle + delta / 6000.0];
}

-(void)pitchWithDelta:(double)delta
{
    [self setPitchAngle:mPitchAngle + delta / 6000.0];
}

-(float)yawAngle
{
    return mYawAngle;
}

-(float)pitchAngle
{
    return mPitchAngle;
}

-(void)setProjectionMatrix:(GLKMatrix4)matrix
{
    mProjection = matrix;
}

#pragma mark - Private methods
-(void)updateLookAt
{
    mLookAt.x = sin(mPitchAngle) * cos(mYawAngle);
    mLookAt.y = cos(mPitchAngle);
    mLookAt.z = sin(mPitchAngle) * sin(mYawAngle);
}

-(GLKVector4)eyeCoordsWithClipCoords:(GLKVector4)clipCoords
{
    GLKMatrix4 invertedProjection = GLKMatrix4Invert(mProjection, NULL);
    GLKVector4 eyeCoords = GLKMatrix4MultiplyVector4(invertedProjection, clipCoords);
    return GLKVector4Make(eyeCoords.x, eyeCoords.y, -1.0f, 0.0f);
}

-(GLKVector3)worldCoordsWithEyeCoords:(GLKVector4)eyeCoords
{
    GLKMatrix4 invertedView = GLKMatrix4Invert([self view], NULL);
    GLKVector4 rayWorld = GLKMatrix4MultiplyVector4(invertedView, eyeCoords);
    GLKVector3 ray = GLKVector3Make(rayWorld.x, rayWorld.y, rayWorld.z);
    return GLKVector3Normalize(ray);
}

@end
